# Encoding: utf-8
require 'test_helper'

# SchemaParser Test
class SchemaEntitiesTest < ActiveSupport::TestCase
  # LocalBusiness test
  test 'LocalBusiness' do
    currency = TextEntity.new(value: '$$')
    duration = DurationEntity.new(value: 'P23DT23H')
    hash = { currencies_accepted: currency,
            opening_hours: duration, payment_accepted: currency,
            price_range: currency, aco: "jones"}
    newclass = LocalBusinessEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
