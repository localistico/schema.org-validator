# Encoding: utf-8
require 'test_helper'

# BrandEntity Test
class BrandEntityTest < ActiveSupport::TestCase
  # BrandEntity test
  test 'brand' do
    logo = URLEntity.new(value: 'http://www.schema.org')
    hash = { logo: logo}
    newclass = BrandEntity.new(hash)
    newclass.valid?
    assert_equal Hash.new, newclass.errors.messages
  end
end
