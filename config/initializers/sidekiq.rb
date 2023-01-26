require 'sidekiq/cron/web'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
  # config.options[:concurrency] = 25
  config.logger.level = Logger::INFO
end

if Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file("config/schedule.yml")
end