# frozen_string_literal: true

Rails.application.configure do
  logger = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = ActiveSupport::Logger::SimpleFormatter.new
  config.logger    = logger
end
