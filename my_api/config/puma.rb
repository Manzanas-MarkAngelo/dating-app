# Puma configuration for both Render and local development

threads_count = ENV.fetch("RAILS_MAX_THREADS", 3).to_i
threads threads_count, threads_count

# Listen on the port Render provides, or default to 3000 locally
port ENV.fetch("PORT") { 3000 }

# Bind to 0.0.0.0 when PORT is set (i.e., in Render); skip in local dev
if ENV["PORT"]
  bind "tcp://0.0.0.0:#{ENV["PORT"]}"
end

# Set environment from RAILS_ENV, defaulting to development locally
environment ENV.fetch("RAILS_ENV") { "development" }

# Allow puma to be restarted by `bin/rails restart`
plugin :tmp_restart

# Run Solid Queue supervisor inside Puma if requested
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Specify a PID file if PIDFILE is set
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
