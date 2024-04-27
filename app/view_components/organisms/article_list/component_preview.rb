# frozen_string_literal: true

module Organisms
  module ArticleList
    class ComponentPreview < ViewComponent::Preview
      ARTICLE_LIST = 12.times.map {
        Struct.new(:id, :title, :body)
              .new(Faker::Number.number, Faker::Lorem.sentence, Faker::Lorem.paragraphs(number: 30).join("\n"))
      }

      def default(articles: ARTICLE_LIST)
        render Organisms::ArticleList::Component.new(articles: ARTICLE_LIST)
      end
    end
  end
end