# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# The asset pipeline for Rails
gem 'vite_rails'

# Use mysql as the database for Active Record
gem 'trilogy'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Active Job
gem 'lambdakiq'

group :development, :test do
  gem 'debug'
  gem 'factory_bot_rails'
  gem 'rspec-parameterized-context'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-thread_safety', require: false
end
