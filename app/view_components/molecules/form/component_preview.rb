# frozen_string_literal: true

module Molecules
  module Form
    class ComponentPreview < ViewComponent::Preview
      def sample
        render Molecules::Form::Component.new do |component|
          component.with_field_text(attribute: :name)
          component.with_field_text_area(attribute: :message, rows: 10)
          component.with_button(label: 'Submit', type: :submit)
        end
      end
    end
  end
end
