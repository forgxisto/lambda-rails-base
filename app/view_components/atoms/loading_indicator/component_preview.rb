# frozen_string_literal: true

module Atoms
  module LoadingIndicator
    class ComponentPreview < ViewComponent::Preview
      def default
        render Atoms::LoadingIndicator::Component.new
      end

      # @param style text "custom style"
      def styled(style: 'font-size: 3px; color: red;')
        render Atoms::LoadingIndicator::Component.new(style:)
      end
    end
  end
end
