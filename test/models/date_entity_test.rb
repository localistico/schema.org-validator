# Encoding: utf-8
require 'test_helper'

# DateEntity Test
class DateEntityTest < ActiveSupport::TestCase
  # Real date test
  test 'real_date_with_-' do
    currency = DateEntity.new(value: '2000-11-11')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # False date test with '/'
  test 'false_date_with_/' do
    currency = DateEntity.new(value: '2000/11/11')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # False date test with '.'
  test 'false_date_with_:' do
    currency = DateEntity.new(value: '2000:11:11')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # False date test (year error)
  test 'false_date_year' do
    currency = DateEntity.new(value: '200:11:11')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # Real date test (year only)
  test 'real_date_year' do
    currency = DateEntity.new(value: '2000')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test (year and month)
  test 'real_date_year_month' do
    currency = DateEntity.new(value: '2000-11')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test (year and month together)
  test 'Real_date_year_month' do
    currency = DateEntity.new(value: '200011')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test without separators
  test 'real_date_together' do
    currency = DateEntity.new(value: '20001111')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test year with 2 digits
  test 'real_date_year_2d' do
    currency = DateEntity.new(value: '10')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test ordinal date (day 111 of 2000)
  test 'real_date_ordinal' do
    currency = DateEntity.new(value: '2000111')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test ordinal date (day 111 of 2000) with '-'
  test 'real_date_ordinal_with-' do
    currency = DateEntity.new(value: '2000-111')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test week
  test 'real_date_week' do
    currency = DateEntity.new(value: '2000-W31')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test week and day
  test 'real_date_week_day' do
    currency = DateEntity.new(value: '2000-W313')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test week and day with '-'
  test 'real_date_week_day_-' do
    currency = DateEntity.new(value: '2000-W31-3')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test week and day without '-'
  test 'real_date_week_day_without_-' do
    currency = DateEntity.new(value: '2000W313')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real date test week and day without '-' and day
  test 'real_date_week_day_without_-day' do
    currency = DateEntity.new(value: '2000W31')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # False date test week >52
  test 'false_date_week>52' do
    currency = DateEntity.new(value: '2000W55')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # False date test (day>8)
  test 'false_date_week_day>7' do
    currency = DateEntity.new(value: '2000W208')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
end
