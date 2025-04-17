# Puma configuration supporting both Render and local dev

threads_count = ENV.fetch("RAILS_MAX_THREADS", 3).to_i
threads threads_count, threads_count

# Listen on PORT (Render) or default to 3000 locally
if ENV["PORT"]
  bind    "tcp://0.0.0.0:#{ENV['PORT']}"
else
  port    3000
end

# Set environment: production on Render, development locally
environment ENV.fetch("RAILS_ENV") { "development" }

# Allow `bin/rails restart`
plugin :tmp_restart

# Run Solid Queue inside Puma if flagged
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# PID file only if specified
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
