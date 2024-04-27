# frozen_string_literal: true

module Organisms
  module ArticleForm
    class Component < ApplicationViewComponent
      def initialize(model:, **args)
        super
        @model = model
        @data = args.delete(:data) || {}
      end

      private

      attr_reader :model

      def data
        @data.merge({
          'hx-post': model.new_record? ? '/articles' : '/articles/' + model.id.to_s,
          'hx-target': '.organisms-article_form',
          'hx-swap': 'outerHTML',
          'hx-indicator': '.full_page_indicator',
        })
      end
    end
  end
end