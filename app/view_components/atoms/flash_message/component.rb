# frozen_string_literal: true

module Atoms
  module FlashMessage
    class Component < ApplicationViewComponent
      def initialize(flash:)
        super
        @flash = flash
      end

      private

      attr_reader :flash
    end
  end
end
