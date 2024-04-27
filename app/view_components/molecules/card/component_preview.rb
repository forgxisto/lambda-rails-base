# frozen_string_literal: true

module Molecules
  module Card
    class ComponentPreview < ViewComponent::Preview
      HEADING = Faker::Lorem.sentence
      PARAGRAPH = Faker::Lorem.paragraphs(number: 30).join("\n")

      # @param heading text "the heading"
      # @param paragraph textarea "the paragraph"
      def default(heading: HEADING, paragraph: PARAGRAPH)
        render Molecules::Card::Component.new do |component|
          component.with_heading { heading }
          component.with_paragraph { paragraph }
        end
      end
    end
  end
end