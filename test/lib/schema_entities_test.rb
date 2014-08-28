# Encoding: utf-8
require 'test_helper'

# SchemaParser Test
class SchemaEntitiesTest < ActiveSupport::TestCase
  # LocalBusiness test
  test 'LocalBusiness' do
    newclass = LocalBusinessEntity.new
    newclass2 = LocalBusinessEntity.new
    newclass.branch_of = newclass2
    assert_equal false, newclass.valid?
  end
end
