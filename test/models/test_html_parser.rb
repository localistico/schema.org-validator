# Encoding: utf-8
require '../../app/models/html_parser.rb'
require 'nokogiri'
require 'yaml'

# Main code
if __FILE__ == $PROGRAM_NAME
  begin
    parser = HtmlParser.new('../fixtures/webpage_demo.html')
    puts parser.analyse_micro_data
    puts YAML.load_file('../fixtures/webparsed.yml')
    
    
    rescue => e
      puts e.message
      puts e.backtrace.inspect
  end

end
