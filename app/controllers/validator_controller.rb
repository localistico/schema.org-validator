class ValidatorController < ApplicationController
  def index
     if request.post?
          @url = params[:url]; #url de la web que se va a analizar
          
          parser = HtmlParser.new(@url);
          
          
     end
  end
end
