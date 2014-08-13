require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HtmlParser
  #This class needs the adress string of the webpage
  def initialize(webadress)
    @adress=webadress
    begin
    @page = Nokogiri::HTML(open(@adress))
    rescue
      raise("Webpage #{@adress} is not available")
    end
  end
  
  #HTML code of the webpage
  def inspect
    "Parser of #{@adress}:\n#{@page}"
  end
  
  #CSS method filters tags
  def css(string)
    @page.css(string)
  end
  
end