# frozen_string_literal: true

module Molecules
  module Section
    class Component < ApplicationViewComponent
      renders_one :heading, Atoms::Heading::Component
      renders_many :blocks, types: {
        paragraph: Atoms::Paragraph::Component,
        division: Atoms::Division::Component
      }
    end
  end
end
