class ValidatorController < ApplicationController
  def index
      @request = false; #control if the user 
    
     #when user pushes the submit button, it creates a HtmlParser object to analyse data.
     if request.post? 
          @url = params[:url]; #url to analyse        
          @urlerror = false; #it isn't any error.
          
          @request = true; #it allow to show the data in the view
          
          #Controlling exceptions
          begin
              @parser = HtmlParser.new(@url);
          rescue #catch the exception and send error to the view.
              @urlerror = true;
          ensure
 
          end
          
     end
  end
end
