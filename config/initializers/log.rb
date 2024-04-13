Rails.application.configure do
  logger = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = ActiveSupport::Logger::SimpleFormatter.new
  config.logger = logger

  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.custom_payload do |controller|
    { requestid: controller.request.request_id }
  end
end
