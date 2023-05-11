source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'pg', '~> 1.1'
gem 'rails', '~> 7.0.4'

gem 'pry', '~> 0.14.1'
gem 'puma', '~> 5.0'
# gem 'redis', '~> 5.0', '>= 5.0.6'
# gem 'sendgrid-ruby'
# gem 'sidekiq', '~> 7.0', '>= 7.0.3'
# gem 'sidekiq-cron', '~> 1.9', '>= 1.9.1'

gem 'activestorage-cloudinary-service', '~> 0.2.3'
gem 'cloudinary', '~> 1.23'

gem 'jwt'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

gem 'figaro', '~> 1.2'

gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
gem 'rswag', '~> 2.8'

# gem 'mail'
gem 'rack-cors'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
