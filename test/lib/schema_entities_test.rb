# Encoding: utf-8
require 'test_helper'

# SchemaParser Test
class SchemaEntitiesTest < ActiveSupport::TestCase
  # LocalBusiness test
  test 'LocalBusiness' do
    business = LocalBusinessEntity.new
    currency = TextEntity.new(value: '$$')
    duration = DurationEntity.new(value: 'P23DT23H')
    hash = { branch_of: business, currencies_accepted: currency,
            opening_hours: duration, payment_accepted: currency,
            price_range: currency }
    newclass = LocalBusinessEntity.new(hash)
    newclass.valid?
    duration.valid?
    assert_equal Hash.new, duration.errors.messages
    assert_equal Hash.new, newclass.errors.messages
  end
end
