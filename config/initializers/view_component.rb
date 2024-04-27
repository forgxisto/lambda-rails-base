# frozen_string_literal: true

Rails.application.configure do
  config.view_component.view_component_path = 'app/view_components'

  unless Rails.env.production?
    require 'lookbook'

    # CORS
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => %w[GET OPTION].join(','),
      'X-Frame-Options' => 'ALLOWALL'
    }

    # lookbook
    config.view_component.default_preview_layout = 'view_component_preview'
    config.action_controller.asset_host = 'https://localhost:3000'
    config.view_component.preview_paths << Rails.root.join('app/view_components').to_s
  end
end
