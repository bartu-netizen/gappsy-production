import React from 'react'
import { useSubscription } from '../../hooks/useSubscription'
import { CheckCircle, XCircle, Clock, AlertTriangle } from 'lucide-react'

export function SubscriptionStatus() {
  const { subscription, loading, error, getSubscriptionPlan, isActive, isTrialing, isPastDue, isCanceled } = useSubscription()

  if (loading) {
    return (
      <div className="bg-white rounded-lg shadow-md p-6">
        <div className="animate-pulse">
          <div className="h-4 bg-gray-200 rounded w-1/4 mb-2"></div>
          <div className="h-6 bg-gray-200 rounded w-1/2"></div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="bg-red-50 border border-red-200 rounded-lg p-4">
        <div className="flex items-center">
          <XCircle className="h-5 w-5 text-red-400 mr-2" />
          <span className="text-red-700">Error loading subscription: {error}</span>
        </div>
      </div>
    )
  }

  if (!subscription || !subscription.subscription_id) {
    return (
      <div className="bg-gray-50 border border-gray-200 rounded-lg p-4">
        <div className="flex items-center">
          <Clock className="h-5 w-5 text-gray-400 mr-2" />
          <span className="text-gray-600">No active subscription</span>
        </div>
      </div>
    )
  }

  const plan = getSubscriptionPlan()
  
  const getStatusIcon = () => {
    if (isActive) return <CheckCircle className="h-5 w-5 text-green-500" />
    if (isTrialing) return <Clock className="h-5 w-5 text-[#0A1735]" />
    if (isPastDue) return <AlertTriangle className="h-5 w-5 text-yellow-500" />
    if (isCanceled) return <XCircle className="h-5 w-5 text-red-500" />
    return <Clock className="h-5 w-5 text-gray-500" />
  }

  const getStatusText = () => {
    if (isActive) return 'Active'
    if (isTrialing) return 'Trial'
    if (isPastDue) return 'Past Due'
    if (isCanceled) return 'Canceled'
    return subscription.subscription_status || 'Unknown'
  }

  const getStatusColor = () => {
    if (isActive) return 'text-green-700 bg-green-50 border-green-200'
    if (isTrialing) return 'text-[#0A1735] bg-[#F4F6FB] border-[#E8ECFA]'
    if (isPastDue) return 'text-yellow-700 bg-yellow-50 border-yellow-200'
    if (isCanceled) return 'text-red-700 bg-red-50 border-red-200'
    return 'text-gray-700 bg-gray-50 border-gray-200'
  }

  return (
    <div className={`border rounded-lg p-4 ${getStatusColor()}`}>
      <div className="flex items-center justify-between">
        <div className="flex items-center">
          {getStatusIcon()}
          <div className="ml-3">
            <h3 className="font-medium">
              {plan ? plan.name : 'Subscription'}
            </h3>
            <p className="text-sm opacity-75">
              Status: {getStatusText()}
            </p>
          </div>
        </div>
        
        {subscription.current_period_end && (
          <div className="text-right">
            <p className="text-sm opacity-75">
              {isCanceled ? 'Ended' : 'Renews'} on
            </p>
            <p className="text-sm font-medium">
              {new Date(subscription.current_period_end * 1000).toLocaleDateString()}
            </p>
          </div>
        )}
      </div>
      
      {subscription.cancel_at_period_end && (
        <div className="mt-3 p-2 bg-yellow-100 border border-yellow-300 rounded text-yellow-800 text-sm">
          Your subscription will cancel at the end of the current period.
        </div>
      )}
    </div>
  )
}