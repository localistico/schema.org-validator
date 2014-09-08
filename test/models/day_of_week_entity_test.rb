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
end
