# frozen_string_literal: true

module Molecules
  module Section
    class ComponentPreview < ViewComponent::Preview
      HEADING = Faker::Lorem.sentence
      PARAGRAPH = Faker::Lorem.paragraphs(number: 30).join("\n")

      # @param heading text "the heading"
      # @param paragraph text "the paragraph"
      def with_paragraph(heading: HEADING, paragraph: PARAGRAPH)
        render Molecules::Section::Component.new do |component|
          component.with_heading { heading }
          component.with_block_paragraph { paragraph }
        end
      end

      # @param heading text "the heading"
      # @param division text "the division"
      def with_division(heading: HEADING, division: PARAGRAPH)
        render Molecules::Section::Component.new do |component|
          component.with_heading { heading }
          component.with_block_division { division }
        end
      end

      # @param heading text "the heading"
      # @param paragraph text "the paragraph"
      # @param division text "the division"
      def with_both(heading: HEADING, paragraph: PARAGRAPH, division: PARAGRAPH)
        render Molecules::Section::Component.new do |component|
          component.with_heading { heading }
          component.with_block_paragraph { paragraph }
          component.with_block_division { division }
        end
      end
    end
  end
end
