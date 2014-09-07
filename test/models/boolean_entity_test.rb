# Encoding: utf-8
require 'test_helper'

# BooleanEntity Test
class BooleanEntityTest < ActiveSupport::TestCase
  # BooleanEntity test (true)
  test 'boolean_true' do
    newclass = BooleanEntity.new(value: true)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # BooleanEntity test (false)
  test 'boolean_false' do
    newclass = BooleanEntity.new(value: false)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
