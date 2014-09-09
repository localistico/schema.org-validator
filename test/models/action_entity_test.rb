# Encoding: utf-8
require 'test_helper'

# Action Test
class ActionEntityTest < ActiveSupport::TestCase
  # Action test
  test 'action' do
    text = TextEntity.new(value: 'bussiness')
    url = URLEntity.new(value: 'http://www.schema.org')
    hash = { alternate_name: text, additional_type: url }
    newclass = ActionEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
