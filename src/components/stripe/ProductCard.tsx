import React, { useState } from 'react'
import { StripeProduct } from '../../config/stripe'
import { useAuth } from '../../hooks/useAuth'
import { supabase } from '../../lib/supabase'
import { CreditCard, Check } from 'lucide-react'

interface ProductCardProps {
  product: StripeProduct
}

export function ProductCard({ product }: ProductCardProps) {
  const { user } = useAuth()
  const [loading, setLoading] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  const handlePurchase = async () => {
    if (!user) {
      setMessage({ type: 'error', text: 'Please sign in to purchase' })
      return
    }

    setLoading(true)
    setMessage(null)

    try {
      const { data: { session } } = await supabase.auth.getSession()
      
      if (!session) {
        setMessage({ type: 'error', text: 'Please sign in to continue' })
        return
      }

      const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/stripe-checkout`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${session.access_token}`,
        },
        body: JSON.stringify({
          price_id: product.priceId,
          success_url: `${window.location.origin}/success?session_id={CHECKOUT_SESSION_ID}`,
          cancel_url: window.location.href,
          mode: product.mode,
        }),
      })

      const data = await response.json()

      if (!response.ok) {
        throw new Error(data.error || 'Failed to create checkout session')
      }

      if (data.url) {
        window.location.href = data.url
      } else {
        throw new Error('No checkout URL received')
      }
    } catch (error) {
      console.error('Checkout error:', error)
      setMessage({ 
        type: 'error', 
        text: error instanceof Error ? error.message : 'Failed to start checkout process' 
      })
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="bg-white rounded-lg shadow-md border border-gray-200 p-6 hover:shadow-lg transition-shadow">
      <div className="mb-4">
        <h3 className="text-xl font-semibold text-gray-900 mb-2">{product.name}</h3>
        <p className="text-gray-600 text-sm leading-relaxed">{product.description}</p>
      </div>

      <div className="mb-6">
        <div className="flex items-baseline">
          <span className="text-3xl font-bold text-gray-900">
            ${product.price.toFixed(2)}
          </span>
          <span className="text-gray-500 ml-2">
            {product.mode === 'subscription' ? '/6 months' : 'one-time'}
          </span>
        </div>
      </div>

      {message && (
        <div className={`mb-4 p-3 rounded-md text-sm ${
          message.type === 'error' 
            ? 'bg-red-50 text-red-700 border border-red-200' 
            : 'bg-green-50 text-green-700 border border-green-200'
        }`}>
          {message.text}
        </div>
      )}

      <button
        onClick={handlePurchase}
        disabled={loading || !user}
        className="w-full bg-indigo-600 text-white py-3 px-4 rounded-md font-medium hover:bg-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-600 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed transition-colors flex items-center justify-center"
      >
        {loading ? (
          <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white"></div>
        ) : (
          <>
            <CreditCard className="w-5 h-5 mr-2" />
            {user ? 'Purchase Now' : 'Sign In to Purchase'}
          </>
        )}
      </button>
    </div>
  )
}