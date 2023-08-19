source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Rails
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'

# Database
gem 'pg', '>= 0.18', '< 2.0'

# Server
gem 'puma', '~> 5.6'

# HTTP Client
gem 'faraday'

# Json API Builder
# gem 'jbuilder', '~> 2.5'

# Redis for Action Cable
# gem 'redis', '~> 4.0'

# Secure Password
# gem 'bcrypt', '~> 3.1.7'

# Image Processing
# gem 'mini_magick', '~> 4.8'

# Deployment
# gem 'capistrano-rails', group: :development

# Performance
gem 'bootsnap', '>= 1.1.0', require: false

# Cross-Origin Resource Sharing (CORS)
gem 'rack-cors'

# Test and Development Gems
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'figaro'
  gem 'pry'
  gem 'rspec-rails'
end

# Development Gems
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'rubocop-graphql'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Test Gems
group :test do
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
end

# Timezone data for Windows
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Factory Bot for testing
gem 'factory_bot_rails'

# Fake data generator
gem 'faker'

# GraphQL and GraphiQL
gem 'graphiql-rails', group: :development
gem 'graphql', '~> 2.0'
