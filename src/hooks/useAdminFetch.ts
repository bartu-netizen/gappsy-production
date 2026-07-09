import { useState, useCallback, useRef, useEffect } from 'react';
import { useAdminSession } from '../contexts/AdminSessionContext';
import {
  adminApiFetch,
  type AdminFetchResult,
  type AdminApiError,
  type AdminFetchOptions,
  isAuthError,
  shouldRedirectToLogin,
  getErrorMessage,
} from '../lib/adminApiFetch';

export type AdminDataState = 'idle' | 'waiting_session' | 'loading' | 'success' | 'empty' | 'error';

export interface UseAdminFetchState<T> {
  state: AdminDataState;
  data: T | null;
  error: AdminApiError | null;
  errorMessage: string | null;
  isLoading: boolean;
  isError: boolean;
  isSuccess: boolean;
  isEmpty: boolean;
  isAuthError: boolean;
}

export interface UseAdminFetchActions {
  refetch: () => Promise<void>;
  reset: () => void;
}

export type UseAdminFetchReturn<T> = UseAdminFetchState<T> & UseAdminFetchActions;

interface UseAdminFetchOptions<T> extends Omit<AdminFetchOptions, 'requireSession'> {
  autoFetch?: boolean;
  enabled?: boolean;
  isEmptyCheck?: (data: T) => boolean;
  onSuccess?: (data: T) => void;
  onError?: (error: AdminApiError) => void;
  deps?: unknown[];
}

export function useAdminFetch<T = unknown>(
  functionPath: string | (() => string | null),
  options: UseAdminFetchOptions<T> = {}
): UseAdminFetchReturn<T> {
  const {
    autoFetch = true,
    enabled = true,
    isEmptyCheck,
    onSuccess,
    onError,
    deps = [],
    ...fetchOptions
  } = options;

  const { status: sessionStatus, isReady, isValid } = useAdminSession();
  const [state, setState] = useState<AdminDataState>('idle');
  const [data, setData] = useState<T | null>(null);
  const [error, setError] = useState<AdminApiError | null>(null);

  const mountedRef = useRef(true);
  const fetchIdRef = useRef(0);
  const hasFetchedRef = useRef(false);

  // Stabilize unstable references so doFetch identity does not change every render.
  // Callers frequently pass inline objects / callbacks which would otherwise cause
  // the effect below to fire on every render and trigger an infinite refetch loop.
  const functionPathRef = useRef(functionPath);
  functionPathRef.current = functionPath;

  const fetchOptionsRef = useRef(fetchOptions);
  fetchOptionsRef.current = fetchOptions;

  const isEmptyCheckRef = useRef(isEmptyCheck);
  isEmptyCheckRef.current = isEmptyCheck;

  const onSuccessRef = useRef(onSuccess);
  onSuccessRef.current = onSuccess;

  const onErrorRef = useRef(onError);
  onErrorRef.current = onError;

  useEffect(() => {
    mountedRef.current = true;
    return () => {
      mountedRef.current = false;
    };
  }, []);

  const doFetch = useCallback(async () => {
    const fp = functionPathRef.current;
    const path = typeof fp === 'function' ? fp() : fp;
    if (!path) {
      setState('idle');
      return;
    }

    if (!isReady) {
      setState('waiting_session');
      return;
    }

    if (!isValid) {
      setState('error');
      setError({
        code: 'no_session',
        message: 'No valid admin session. Please log in.',
        retryable: false,
      });
      return;
    }

    const currentFetchId = ++fetchIdRef.current;
    setState('loading');
    setError(null);

    console.log(`[useAdminFetch] fetchId=${currentFetchId} path=${path} starting`);

    const result: AdminFetchResult<T> = await adminApiFetch<T>(path, {
      ...fetchOptionsRef.current,
      requireSession: true,
    });

    if (!mountedRef.current) {
      console.log(`[useAdminFetch] fetchId=${currentFetchId} unmounted, ignoring`);
      return;
    }

    if (currentFetchId !== fetchIdRef.current) {
      console.log(`[useAdminFetch] fetchId=${currentFetchId} stale (current=${fetchIdRef.current}), ignoring`);
      return;
    }

    console.log(`[useAdminFetch] fetchId=${currentFetchId} result ok=${result.ok}`);

    if (!result.ok) {
      setState('error');
      setError(result.error!);
      onErrorRef.current?.(result.error!);

      if (shouldRedirectToLogin(result.error!)) {
        setTimeout(() => {
          window.location.href = '/wp-admin?reason=session_expired';
        }, 100);
      }
      return;
    }

    const resultData = result.data as T;
    const isEmpty = isEmptyCheckRef.current ? isEmptyCheckRef.current(resultData) : false;

    setData(resultData);
    setState(isEmpty ? 'empty' : 'success');
    onSuccessRef.current?.(resultData);
    hasFetchedRef.current = true;
  }, [isReady, isValid]);

  // Resolve the current path primitive so the auto-fetch effect can react to
  // string-level changes without depending on function identity.
  const resolvedPath = typeof functionPath === 'function' ? functionPath() : functionPath;

  useEffect(() => {
    if (!autoFetch || !enabled) return;

    if (!isReady) {
      setState('waiting_session');
      return;
    }

    doFetch();
    // doFetch is intentionally stable (only depends on session state). Including
    // `deps` lets consumers opt-in to extra refetch triggers via primitives.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [autoFetch, enabled, isReady, sessionStatus, resolvedPath, doFetch, ...deps]);

  const refetch = useCallback(async () => {
    await doFetch();
  }, [doFetch]);

  const reset = useCallback(() => {
    fetchIdRef.current++;
    setState('idle');
    setData(null);
    setError(null);
    hasFetchedRef.current = false;
  }, []);

  return {
    state,
    data,
    error,
    errorMessage: error ? getErrorMessage(error) : null,
    isLoading: state === 'loading' || state === 'waiting_session',
    isError: state === 'error',
    isSuccess: state === 'success',
    isEmpty: state === 'empty',
    isAuthError: error ? isAuthError(error) : false,
    refetch,
    reset,
  };
}

interface UseAdminMutationOptions<T, V> extends Omit<AdminFetchOptions, 'body' | 'method'> {
  onSuccess?: (data: T) => void;
  onError?: (error: AdminApiError) => void;
}

interface UseAdminMutationState<T> {
  data: T | null;
  error: AdminApiError | null;
  errorMessage: string | null;
  isLoading: boolean;
  isError: boolean;
  isSuccess: boolean;
}

interface UseAdminMutationReturn<T, V> extends UseAdminMutationState<T> {
  mutate: (variables: V) => Promise<AdminFetchResult<T>>;
  reset: () => void;
}

export function useAdminMutation<T = unknown, V = unknown>(
  functionPath: string | ((variables: V) => string),
  method: 'POST' | 'PUT' | 'DELETE' | 'PATCH' = 'POST',
  options: UseAdminMutationOptions<T, V> = {}
): UseAdminMutationReturn<T, V> {
  const { onSuccess, onError, ...fetchOptions } = options;

  const { isReady, isValid } = useAdminSession();
  const [data, setData] = useState<T | null>(null);
  const [error, setError] = useState<AdminApiError | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);

  const mutate = useCallback(async (variables: V): Promise<AdminFetchResult<T>> => {
    if (!isReady || !isValid) {
      const authError: AdminApiError = {
        code: 'no_session',
        message: 'No valid admin session',
        retryable: false,
      };
      setError(authError);
      return { ok: false, error: authError };
    }

    const path = typeof functionPath === 'function' ? functionPath(variables) : functionPath;

    setIsLoading(true);
    setError(null);
    setIsSuccess(false);

    const result = await adminApiFetch<T>(path, {
      ...fetchOptions,
      method,
      body: variables,
      retries: 0,
    });

    setIsLoading(false);

    if (!result.ok) {
      setError(result.error!);
      onError?.(result.error!);
      return result;
    }

    setData(result.data as T);
    setIsSuccess(true);
    onSuccess?.(result.data as T);
    return result;
  }, [functionPath, method, fetchOptions, isReady, isValid, onSuccess, onError]);

  const reset = useCallback(() => {
    setData(null);
    setError(null);
    setIsLoading(false);
    setIsSuccess(false);
  }, []);

  return {
    data,
    error,
    errorMessage: error ? getErrorMessage(error) : null,
    isLoading,
    isError: !!error,
    isSuccess,
    mutate,
    reset,
  };
}
