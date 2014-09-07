# Encoding: utf-8
require 'test_helper'

# CountryEntity Test
class CountryEntityTest < ActiveSupport::TestCase
  # Country test
  test 'country' do
    text = TextEntity.new(value: '999999')
    hash = { fax_number: text }
    newclass = CountryEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
