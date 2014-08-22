# encoding: UTF-8
# Validator helper
module ValidatorHelper
  # Get the html code from a hash
  def get_html(hash)
    @output = '' # This variable holds the html code
    extract_html(hash)
  end
  # Extract html code from a hash
  def extract_html(hash)
    hash.nil? ? return :
    begin
      hash.each do |key, value|
        @output += "<ul><b>#{key}:</b>  "
        extract_html(value)
        @output += '</ul>'
      end
    rescue
      @output += "#{hash}"
    end
  end
end
