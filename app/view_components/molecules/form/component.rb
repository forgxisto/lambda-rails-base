# frozen_string_literal: true

module Molecules
  module Form
    class Component < ApplicationViewComponent
      renders_many :fields, types: {
        text: ->(args) { Atoms::Fields::TextField::Component.new(form:, **args) },
        text_area: ->(args) { Atoms::Fields::TextArea::Component.new(form:, **args) }
      }
      renders_many :buttons, Atoms::Button::Component

      private

      def form
        @form ||= begin
          f = nil
          helpers.form_with(**args) { f = _1 }
          f
        end
      end
    end
  end
end