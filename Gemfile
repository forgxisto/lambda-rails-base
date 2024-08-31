# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.1'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# The asset pipeline for Rails
gem 'propshaft'
gem 'jsbundling-rails'
gem 'cssbundling-rails'

# View Component
gem 'view_component'
gem 'lookbook'

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

group :development, :test do
  gem 'puma'
  gem 'debug'
  gem 'factory_bot_rails'
  gem 'rspec-parameterized-context'
  gem 'rspec-rails'
  gem 'faker'
end

group :development do
  gem 'listen'
  gem 'actioncable'

  gem 'annotate', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-thread_safety', require: false

  gem 'brakeman', require: false
  gem 'bundler-audit', require: false

  gem 'ruby-lsp', require: false
end
