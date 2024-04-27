# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# The asset pipeline for Rails
gem 'vite_rails'

# View Component
gem 'view_component'

# Use mysql as the database for Active Record
gem 'trilogy'

# Active Job
gem 'lambdakiq'

# AWS
gem 'aws-sdk-sqs'
gem 'aws-sdk-s3'

# Log
gem 'lograge'

# Bootsnap
gem 'bootsnap', require: false

# Lambda container
gem 'lamby'
gem 'rack', '~> 2.0', '>= 2.2.9'

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
