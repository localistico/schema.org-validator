# Encoding: utf-8
require 'test_helper'

# DemandEntity Test
class DemandEntityTest < ActiveSupport::TestCase
  # DemandEntity test
  test 'demand' do
    text = TextEntity.new(value: 'bussiness')
    hash = { alternate_name: text }
    newclass = DemandEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
