Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://my-frontend.onrender.com' # Your frontend URL
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end