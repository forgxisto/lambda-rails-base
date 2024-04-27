# frozen_string_literal: true

module Atoms
  module Heading
    class ComponentPreview < ViewComponent::Preview
      HEADING = Faker::Lorem.sentence

      # @param content text "the heading content"
      def default(content: HEADING)
        render Atoms::Heading::Component.new do
          content
        end
      end
    end
  end
end
