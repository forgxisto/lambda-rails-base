# frozen_string_literal: true

module Atoms
  module FlashMessage
    class ComponentPreview < ViewComponent::Preview
      # @param message_type select choices: [notice, alert]
      # @param message text "This is a flash message"
      def default(message_type: 'notice', message: 'This is a flash message')
        render Atoms::FlashMessage::Component.new(flash: build_flash(message_type:, message:))
      end

      private

      def build_flash(message_type:, message:)
        ActionDispatch::Flash::FlashHash.new.tap { _1[message_type] = message }
      end
    end
  end
end
