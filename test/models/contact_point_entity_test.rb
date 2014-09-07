# Encoding: utf-8
require 'test_helper'

# ContactPointEntity Test
class ContactPointEntityTest < ActiveSupport::TestCase
  # ContactPointOption test
  test 'contact_point' do
  	text = TextEntity.new(value: 'bussiness')
    url = URLEntity.new(value: 'http://www.schema.org')
    hash = { alternate_name: text, additional_type: url }
    area_served = AdministrativeAreaEntity.new(hash)
    hash = { area_served: area_served}
    newclass = ContactPointEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
