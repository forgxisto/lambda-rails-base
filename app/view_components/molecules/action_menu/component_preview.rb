# frozen_string_literal: true

module Molecules
  module ActionMenu
    class ComponentPreview < ViewComponent::Preview
      def default(class_names: nil)
        render Molecules::ActionMenu::Component.new(class_names:) do |component|
          component.with_link(label: 'Back to Index', href: '/')
          component.with_action(label: 'Cancel', href: '#')
          component.with_action(label: 'Save', path: '#', method: :put)
        end
      end

      # @param class_names select { choices: [small] }
      def small(class_names: 'small')
        render Molecules::ActionMenu::Component.new(class_names:) do |component|
          component.with_link(label: 'Back to Index', href: '/')
          component.with_action(label: 'Cancel', href: '#')
          component.with_action(label: 'Save', path: '#', method: :put)
        end
      end
    end
  end
end
