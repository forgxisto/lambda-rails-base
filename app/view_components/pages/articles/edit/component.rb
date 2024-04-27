# frozen_string_literal: true

module Pages
  module Articles
    module Edit
      class Component < ApplicationViewComponent
        attr_reader :context

        def initialize(context:, **args)
          super
          @context = context
        end
      end
    end
  end
end