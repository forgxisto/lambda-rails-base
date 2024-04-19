# frozen_string_literal: true

ActionMailer::MailDeliveryJob.include Lambdakiq::Worker
ActionMailer::MailDeliveryJob.queue_as ENV.fetch('JOBS_QUEUE_NAME', 'default')
