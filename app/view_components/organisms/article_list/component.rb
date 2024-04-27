# frozen_string_literal: true

module Organisms
  module ArticleList
    class Component < ApplicationViewComponent
      attr_reader :articles

      def initialize(articles:, **args)
        super
        @articles = articles
      end
    end
  end
end