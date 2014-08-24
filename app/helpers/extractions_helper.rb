# encoding: UTF-8
# Validator extraction
module ExtractionsHelper
	 # Get the html code from a hash
  def get_html(hash)
    @output = '' # This variable holds the html code
    extract_html(hash)
  end
  # Extract html code from a hash
  def extract_html(hash)
    hash.nil? ? return :
    begin
    #  if hash.is_a(Array) and !hash.is_a(Hash)
    #      @output += "#{hash[0]}"
    #  else 
          hash.each do |key, value|
          @output += "<ul><b>#{key}:</b>  "
          extract_html(value)
          @output += '</ul>'
        end
     # end
    rescue
      @output += "#{hash}"
    end
  end
end
