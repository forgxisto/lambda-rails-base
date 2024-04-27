# frozen_string_literal: true

module Atoms
  module Button
    class Component < ApplicationViewComponent
      def initialize(name: nil, **args)
        super
        @name = name
        @label = args.delete(:label)
        @path = args.delete(:path)
        @type = args.delete(:type) || :button
      end

      private

      attr_reader :name, :label, :path, :type

      def helper
        if args[:href]
          :link_to
        elsif args[:method]
          :button_to
        else
          :button_tag
        end
      end

      # @override
      def class_names
        [super, type].compact.join(' ')
      end
    end
  end
end
