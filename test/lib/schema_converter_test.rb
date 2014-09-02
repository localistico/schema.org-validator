# Encoding: utf-8
require 'test_helper'

# SchemaConverter Test
class SchemaConverterTest < ActiveSupport::TestCase
  # LocalBusiness test
  test 'LocalBusiness' do
    parser = SchemaParser.new('test/fixtures/webpage_demo.html')
    final = SchemaConverter.new(parser.hash)
    assert_equal final.conversion, 'http://schema.org/LocalBusiness'
  end
end