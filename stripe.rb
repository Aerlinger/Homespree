unless Rails.env.production?
  Stripe.api_key    = ENV['STRIPE_TEST_SECRET_KEY']
  STRIPE_PUBLIC_KEY = STRIPE_TEST_PUBLIC_KEY
end