import { useState, useEffect } from 'react'
import { supabase } from '../lib/supabase'
import { getProductByPriceId } from '../config/stripe'

interface UserSubscription {
  customer_id: string | null
  subscription_id: string | null
  subscription_status: 'not_started' | 'incomplete' | 'incomplete_expired' | 'trialing' | 'active' | 'past_due' | 'canceled' | 'unpaid' | 'paused' | null
  price_id: string | null
  current_period_start: number | null
  current_period_end: number | null
  cancel_at_period_end: boolean | null
  payment_method_brand: string | null
  payment_method_last4: string | null
}

export function useSubscription() {
  const [subscription, setSubscription] = useState<UserSubscription | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchSubscription() {
      try {
        const { data: { user } } = await supabase.auth.getUser()
        
        if (!user) {
          setSubscription(null)
          setLoading(false)
          return
        }

        const { data, error } = await supabase
          .from('stripe_user_subscriptions')
          .select('*')
          .maybeSingle()

        if (error) {
          console.error('Error fetching subscription:', error)
          setError(error.message)
        } else {
          setSubscription(data)
        }
      } catch (err) {
        console.error('Error fetching subscription:', err)
        setError('Failed to fetch subscription')
      } finally {
        setLoading(false)
      }
    }

    fetchSubscription()
  }, [])

  const getSubscriptionPlan = () => {
    if (!subscription?.price_id) return null
    return getProductByPriceId(subscription.price_id)
  }

  const isActive = subscription?.subscription_status === 'active'
  const isTrialing = subscription?.subscription_status === 'trialing'
  const isPastDue = subscription?.subscription_status === 'past_due'
  const isCanceled = subscription?.subscription_status === 'canceled'

  return {
    subscription,
    loading,
    error,
    getSubscriptionPlan,
    isActive,
    isTrialing,
    isPastDue,
    isCanceled,
  }
}