# frozen_string_literal: true

module Molecules
  module ActionMenu
    class Component < ApplicationViewComponent
      renders_many :links, Atoms::Link::Component
      renders_many :actions, Atoms::Button::Component
    end
  end
end
