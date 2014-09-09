# Encoding: utf-8
require 'test_helper'

# ContactPointOptionEntity Test
class ContactPointOptionEntityTest < ActiveSupport::TestCase
  # ContactPointOptionOption test
  test 'contact_point_option' do
    additional_type = URLEntity.new(value: 'http://www.schema.org')
    hash = { additional_type: additional_type }
    newclass = ContactPointOptionEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
