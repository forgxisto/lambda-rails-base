# frozen_string_literal: true

module Atoms
  module Paragraph
    class ComponentPreview < ViewComponent::Preview
      PARAGRAPH = Faker::Lorem.paragraphs(number: 30).join("\n")

      # @param content text "the paragraph content"
      def default(content: PARAGRAPH)
        render Atoms::Paragraph::Component.new do
          content
        end
      end
    end
  end
end
