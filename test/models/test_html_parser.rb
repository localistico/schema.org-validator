# Encoding: utf-8
require 'yaml'
require 'test_helper'

# HtmlParser Test
class HtmlParserTest < ActiveSupport::TestCase
  # Main test: hash generation
  test 'the truth' do
    begin
      parser = HtmlParser.new('../fixtures/webpage_demo.html')
      file = YAML.load_file('../fixtures/webparsed.yml')
      assert parser == file
    rescue => e
      puts e.message
      puts e.backtrace.inspect
      assert false
    end
  end
end
