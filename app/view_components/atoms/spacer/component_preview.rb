# frozen_string_literal: true

module Atoms
  module Spacer
    class ComponentPreview < ViewComponent::Preview
      def default
        render Atoms::Spacer::Component.new
      end
    end
  end
end
