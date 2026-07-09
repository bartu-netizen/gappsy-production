import React from 'react'
import { stripeProducts } from '../config/stripe'
import { ProductCard } from '../components/stripe/ProductCard'
import { SubscriptionStatus } from '../components/stripe/SubscriptionStatus'
import { useAuth } from '../hooks/useAuth'

export function Products() {
  const { user } = useAuth()

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">
            Premium Marketing Services
          </h1>
          <p className="text-xl text-gray-600 max-w-3xl mx-auto">
            Boost your agency's visibility and attract more clients with our premium placement options
          </p>
        </div>

        {user && (
          <div className="mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-4">Your Subscription</h2>
            <SubscriptionStatus />
          </div>
        )}

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {stripeProducts.map((product) => (
            <ProductCard key={product.priceId} product={product} />
          ))}
        </div>

        {!user && (
          <div className="mt-12 text-center">
            <p className="text-gray-600 mb-4">
              Sign in to purchase any of our premium services
            </p>
            <div className="space-x-4">
              <a
                href="/login"
                className="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 transition-colors"
              >
                Sign In
              </a>
              <a
                href="/signup"
                className="inline-flex items-center px-6 py-3 border border-gray-300 text-base font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
              >
                Create Account
              </a>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}