# frozen_string_literal: true

# IncrementStarJob
class IncrementStarJob < ApplicationJob
  def perform(article_id)
    Article.find(article_id).increment(:star_count)
  end
end
