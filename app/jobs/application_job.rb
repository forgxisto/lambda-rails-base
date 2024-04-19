# frozen_string_literal: true

# ApplicationJob
class ApplicationJob < ActiveJob::Base
  include Lambdakiq::Worker
  queue_as ENV.fetch('JOBS_QUEUE_NAME', 'default')
end
