# frozen_string_literal: true

module Atoms
  module Fields
    module TextField
      class ComponentPreview < ViewComponent::Preview
        # @param attribute text "the model attribute or name"
        # @param required toggle "is the text field required?"
        def default(attribute: :name, required: false)
          render Atoms::Fields::TextField::Component.new(attribute:, required:)
        end
      end
    end
  end
end
