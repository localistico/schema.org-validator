# encoding: UTF-8
# Validator helper
module ValidatorHelper
  
  @fila = 0
  def get_html (hash) 
    if hash.nil?
      return
    end
    
    begin
      hash.each do |key,value|
        #@output += @fila%2==0 ? "<div id = ""color1"">" : "<div id = ""color2"">"
        @output += "<ul><b>#{key}:</b>  "
        @fila += 1 
        get_html(value)
        @output += "</ul>"
        
      end
    rescue
      @output += "#{hash}"
    end
    
    
  end
  


  

  
  
end
