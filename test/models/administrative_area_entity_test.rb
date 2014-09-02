# Encoding: utf-8
require 'test_helper'

# AdministrativeArea Test
class AdministrativeAreaEntityTest < ActiveSupport::TestCase
  # AdministrativeArea test
  test 'administrative_area' do
    text = TextEntity.new(value: 'bussiness')
    url = URLEntity.new(value: 'http://www.schema.org')
    hash = { alternate_name: text, additional_type: url }
    newclass = AdministrativeAreaEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
