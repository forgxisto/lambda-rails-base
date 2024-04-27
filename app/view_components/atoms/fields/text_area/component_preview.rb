# frozen_string_literal: true

module Atoms
  module Fields
    module TextArea
      class ComponentPreview < ViewComponent::Preview
        # @param attribute text "the model attribute or name"
        # @param required toggle "is the text area field required?"
        def default(attribute: :message, required: false)
          render Atoms::Fields::TextArea::Component.new(attribute:, required:)
        end
      end
    end
  end
end
