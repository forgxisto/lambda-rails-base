# frozen_string_literal: true

module Atoms
  module Division
    class ComponentPreview < ViewComponent::Preview
      PARAGRAPH = Faker::Lorem.paragraphs(number: 30).join("\n")

      # @param content text "the division content"
      def default(content: PARAGRAPH)
        render Atoms::Division::Component.new do
          content
        end
      end
    end
  end
end
