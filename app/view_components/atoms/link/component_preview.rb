# frozen_string_literal: true

module Atoms
  module Link
    class ComponentPreview < ViewComponent::Preview
      # @param label text "the button label"
      # @param href text "link destination"
      def link(label: 'Link', href: '#')
        render Atoms::Link::Component.new(label:, href:)
      end
    end
  end
end
