# encoding: UTF-8
# Controller to the validator view.
class ValidatorController < ApplicationController
  @request = false # Control if the user
  def index
    (!request.post?) ? return :
    # When user pushes the submit button, the application analyses data.
    @url = params[:url] # Url to analyse.
    @urlerror = false # It isn't any error.
    @request = true # It allow to show the data in the view.
    # Controlling exceptions.
    begin
      @parser = HtmlParser.new(@url) # to change.
    rescue # Catch the exception and send error to the view.
      @urlerror = true
    end
  end
end
