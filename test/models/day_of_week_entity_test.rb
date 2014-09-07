# Encoding: utf-8
require 'test_helper'

# DayOfWeekEntity Test
class DayOfWeekEntityTest < ActiveSupport::TestCase
  # DayOfWeekEntity test
  test 'day_of_week' do
  	text = TextEntity.new(value: 'bussiness')
    hash = { alternate_name: text}
    newclass = DayOfWeekEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
