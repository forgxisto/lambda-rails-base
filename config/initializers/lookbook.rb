# frozen_string_literal: true

unless Rails.env.production?
  Rails.application.configure do
    # lookbook
    config.view_component.default_preview_layout = 'view_component_preview'
    config.action_controller.asset_host = 'https://localhost:3000'
    config.view_component.preview_paths << Rails.root.join('app/view_components').to_s
  end
end
