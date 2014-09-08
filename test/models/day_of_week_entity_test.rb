# Encoding: utf-8
require 'test_helper'

# DayOfWeekEntity Test
class DayOfWeekEntityTest < ActiveSupport::TestCase
  # DayOfWeekEntity test (monday)
  test 'day_of_week_monday' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Monday')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (tuesday)
  test 'day_of_week_tuesday' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Tuesday')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (wednesday)
  test 'day_of_week_wednesday' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Wednesday')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (Thursday)
  test 'day_of_week_thursday' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Thursday')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (Friday)
  test 'day_of_week_friday' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Friday')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (Saturday)
  test 'day_of_week_saturday' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Saturday')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (Sunday)
  test 'day_of_week_sunday' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Sunday')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (PublicHolidays)
  test 'day_of_week_public_holidays' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#PublicHolidays')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (error)
  test 'day_of_week_error' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#Error')
    newclass.valid?
    assert_not_equal Hash.new, newclass.errors.messages
  end
  # DayOfWeekEntity test (error2)
  test 'day_of_week_error2' do
    newclass = DayOfWeekEntity.new(value: 'http://purl.org/goodrelations/v1#')
    newclass.valid?
    assert_not_equal Hash.new, newclass.errors.messages
  end
end
