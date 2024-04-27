# frozen_string_literal: true

module Atoms
  module Link
    class Component < ApplicationViewComponent
      def initialize(name: nil, **args)
        super
        @name = name
        @label = args.delete(:label)
        @class_names = args.delete(:class_names)
        @args = args
      end

      private

      attr_reader :name, :label

      def options
        @options ||= begin
          {
            class: class_names,
            **args
          }
        end
      end

      # @override
      def class_names
        [super, @class_names].compact.join(' ')
      end
    end
  end
end
