# Encoding: utf-8
require 'test_helper'

# TimeEntity Test
class TimeEntityTest < ActiveSupport::TestCase
  # Real time test
  test 'real_time' do
    currency = TimeEntity.new(value: '11:26:53+07:00')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # False time (hours = 33)
  test 'false_time' do
    currency = TimeEntity.new(value: '33:26:53+07:00')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # Bad format
  test 'false_format_time' do
    currency = TimeEntity.new(value: '11-26-53+07:00')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # Real time UTC
  test 'real_time_utc' do
    currency = TimeEntity.new(value: '11:26:53Z')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # False time UTC (hours = 25)
  test 'false_time_utc' do
    currency = TimeEntity.new(value: '25:26:53Z')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # False time with 'A'
  test 'false_time_utc_another_char' do
    currency = TimeEntity.new(value: '25:26:53A')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # Real time without 'Z'
  test 'real_time_without_char' do
    currency = TimeEntity.new(value: '21:26:53')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Time without seconds
  test 'false_time_without_sec' do
    currency = TimeEntity.new(value: '21:26')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # Time UTC without seconds
  test 'false_time_utc_without_sec' do
    currency = TimeEntity.new(value: '21:26Z')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # Negative time
  test 'false_time_negative' do
    currency = TimeEntity.new(value: '-21:26:33')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
  # Time without numbers
  test 'false_time_text' do
    currency = TimeEntity.new(value: 'hh:mm:ss')
    currency.valid?
    assert_not_equal Hash.new, currency.errors.messages
  end
end
