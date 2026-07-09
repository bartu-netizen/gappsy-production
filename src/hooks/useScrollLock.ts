import { useEffect, useRef } from 'react';

export function useScrollLock(isLocked: boolean) {
  const scrollPositionRef = useRef(0);

  useEffect(() => {
    if (isLocked) {
      // Save current scroll position
      scrollPositionRef.current = window.scrollY || window.pageYOffset;

      // Lock body scroll
      document.body.style.position = 'fixed';
      document.body.style.top = `-${scrollPositionRef.current}px`;
      document.body.style.left = '0';
      document.body.style.right = '0';
      document.body.style.width = '100%';
    } else {
      // Restore scroll position
      const scrollY = scrollPositionRef.current;
      document.body.style.position = '';
      document.body.style.top = '';
      document.body.style.left = '';
      document.body.style.right = '';
      document.body.style.width = '';
      window.scrollTo(0, scrollY);
    }

    // Cleanup on unmount
    return () => {
      if (isLocked) {
        const scrollY = scrollPositionRef.current;
        document.body.style.position = '';
        document.body.style.top = '';
        document.body.style.left = '';
        document.body.style.right = '';
        document.body.style.width = '';
        window.scrollTo(0, scrollY);
      }
    };
  }, [isLocked]);
}
