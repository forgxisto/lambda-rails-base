# frozen_string_literal: true

module Atoms
  module Fields
    class Base < ApplicationViewComponent
      def initialize(attribute: nil, form: nil, **args)
        super
        @attribute = attribute
        @form = form
        @data = args.delete(:data)
        @args = args
      end

      private

      attr_reader :attribute, :form

      def data
        return @data if form.blank? || attribute.blank?

        (@data || {}).merge(errors:)
      end

      def value
        return form.object.send(attribute) if form.present? && attribute.present?

        args.delete(:value)
      end

      def errors
        return if form.blank? || attribute.blank?

        form.object.try(:errors)&.full_messages_for(attribute)&.join("\n")
      end

      def field_set_class_names
        ['atoms-fields', class_names].join(' ')
      end

      def label_class_names
        [
          'label',
          ActiveModel::Type::Boolean.new.cast(args[:required]) ? 'required' : nil
        ].compact.join(' ')
      end

      def field_class_names
        ['field', class_names, errors.present? ? 'invalid' : nil].compact.join(' ')
      end
    end
  end
end
