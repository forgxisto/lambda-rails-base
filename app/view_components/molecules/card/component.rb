# frozen_string_literal: true

module Molecules
  module Card
    class Component < ApplicationViewComponent
      renders_one :heading, Atoms::Heading::Component
      renders_one :paragraph, Atoms::Paragraph::Component

      private

      def href
        args[:href] || '#'
      end
    end
  end
end
