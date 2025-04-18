Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173', 'http://127.0.0.1:5173', 'https://my-frontend-m1c7.onrender.com'
    resource '*',
      headers: :any,
      methods: %i[get post put patch delete options head],
      credentials: true
  end
end
