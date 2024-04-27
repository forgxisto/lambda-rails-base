# frozen_string_literal: true

# ViewComponent の既定クラス
class ApplicationViewComponent < ViewComponent::Base
  def initialize(**args)
    super
    @class_names = args.delete(:class_names) || []
    @args = args
  end

  erb_template <<~ERB
    <div class="<%= class_names %>"></div>
  ERB

  private

  attr_reader :args

  def class_names
    component_class_name = self.class.module_parent_name.underscore.tr('/', '-')

    [component_class_name, *@class_names].compact.join(' ')
  end
end
