# frozen_string_literal: true

module Atoms
  module Button
    class ComponentPreview < ViewComponent::Preview
      # @param label text "the button label"
      # @param type select { choices: [button, submit] }
      def default(label: 'Button', type: 'button')
        render Atoms::Button::Component.new(label:, type:)
      end

      # @param label text "the button label"
      # @param href text "link destination"
      def link(label: 'Link', href: '#')
        render Atoms::Button::Component.new(label:, href:)
      end

      # @param label text "the button label"
      # @param method select { choices: [get, post, delete, put] }
      # @param path text "request path"
      def submit(label: 'Post', path: '/', method: :post)
        render Atoms::Button::Component.new(label:, path:, method:)
      end
    end
  end
end
