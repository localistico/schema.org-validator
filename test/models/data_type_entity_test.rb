# Encoding: utf-8
require 'test_helper'

# DataTypeEntity Test
class DataTypeEntityTest < ActiveSupport::TestCase
  # DataTypeEntity test (numeric)
  test 'data_type_numeric' do
    newclass = DataTypeEntity.new(value: 5)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DataTypeEntity test (string)
  test 'data_type_string' do
    newclass = DataTypeEntity.new(value: 'data')
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
  # DataTypeEntity test (empty)
  test 'data_type_empty' do
    newclass = DataTypeEntity.new
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
