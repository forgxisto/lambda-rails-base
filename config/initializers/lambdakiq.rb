if Rails.env.development?
  Rails.application.configure do
    config.after_initialize do
      config.active_job.verbose_enqueue_logs = true
      config.active_job.logger = config.logger
      config.lambdakiq.metrics_logger = config.logger
    end
  end
end
