# Encoding: utf-8
require 'test_helper'

# DemandEntity Test
class DurationEntityTest < ActiveSupport::TestCase
  # DurationEntity test
  test 'duration' do
    newclass = DurationEntity.new(value: 'P3Y6M4DT12H30M5S')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
