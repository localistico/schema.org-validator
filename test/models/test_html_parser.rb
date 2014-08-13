load '../../app/models/nokogiri_parser.rb'

# Main code
if __FILE__ == $PROGRAM_NAME
  begin
  parser = HtmlParser.new("../fixtures/webpage_demo.html")
  puts parser.css("span[itemprop]")
  # puts parser.inspect
  
  rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
  end

end