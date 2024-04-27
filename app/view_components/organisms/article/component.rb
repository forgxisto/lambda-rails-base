# frozen_string_literal: true

module Organisms
  module Article
    class Component < ApplicationViewComponent
      def initialize(article:, **args)
        super
        @article = article
      end

      private

      attr_reader :article
    end
  end
end