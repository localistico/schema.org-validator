# Encoding: utf-8
require 'test_helper'

# CreativeWorkEntity Test
class CreativeWorkEntityTest < ActiveSupport::TestCase
  # CreativeWorkEntity test
  test 'creative_work' do
    alternate_name = TextEntity.new(value: 'bussiness')
    hash = { alternate_name: alternate_name }
    newclass = CreativeWorkEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
