# Encoding: utf-8
require 'test_helper'

# TimeEntity Test
class TimeEntityTest < ActiveSupport::TestCase
  # Real time test
  test 'real_time' do
    time = TimeEntity.new(value: '11:26:53+07:00')
    time.valid?
    assert_equal Hash.new, time.errors.messages
  end
  # False time (hours = 33)
  test 'false_time' do
    time = TimeEntity.new(value: '33:26:53+07:00')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
  # Bad format
  test 'false_format_time' do
    time = TimeEntity.new(value: '11-26-53+07:00')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
  # Real time UTC
  test 'real_time_utc' do
    time = TimeEntity.new(value: '11:26:53Z')
    time.valid?
    assert_equal Hash.new, time.errors.messages
  end
  # False time UTC (hours = 25)
  test 'false_time_utc' do
    time = TimeEntity.new(value: '25:26:53Z')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
  # False time with 'A'
  test 'false_time_utc_another_char' do
    time = TimeEntity.new(value: '25:26:53A')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
  # Real time without 'Z'
  test 'real_time_without_char' do
    time = TimeEntity.new(value: '21:26:53')
    time.valid?
    assert_equal Hash.new, time.errors.messages
  end
  # Time without seconds
  test 'false_time_without_sec' do
    time = TimeEntity.new(value: '21:26')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
  # Time UTC without seconds
  test 'false_time_utc_without_sec' do
    time = TimeEntity.new(value: '21:26Z')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
  # Negative time
  test 'false_time_negative' do
    time = TimeEntity.new(value: '-21:26:33')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
  # Time without numbers
  test 'false_time_text' do
    time = TimeEntity.new(value: 'hh:mm:ss')
    time.valid?
    assert_not_equal Hash.new, time.errors.messages
  end
end
