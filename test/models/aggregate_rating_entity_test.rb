# Encoding: utf-8
require 'test_helper'

# AggregateRatingEntity Test
class AggregateRatingEntityTest < ActiveSupport::TestCase
  # AggregateRatingEntity test
  test 'aggregate_rating' do
    rating_count = NumberEntity.new(value: 3)
    review_count = NumberEntity.new(value: 7)
    text = TextEntity.new(value: 'rating_value')
    hash = { rating_count: rating_count, review_count: review_count,
    rating_value: text }
    newclass = AggregateRatingEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
