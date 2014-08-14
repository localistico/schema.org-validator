require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Class that parses the HTML code of a webpage and extracts schema information
class HtmlParser
  # This class needs the adress string of the webpage
  def initialize(webadress)
    @adress=webadress
    begin
    @page = Nokogiri::HTML(open(@adress))
    rescue
      raise("Webpage #{@adress} is not available")
    end
  end
  
  # HTML code of the webpage
  def inspect
    "Parser of #{@adress}:\n#{@page}"
  end
  
  # CSS method filters tags
  def css(string)
    @page.css(string)
  end
  
  # CSS method that builds the hierarchical structure of the tags in MicroData
  def analyseMicroData
    
    # Hash table of results
    hashresults={}
    
    # Obtain all the schema main itemscopes
    self.css("div[itemscope]").select{|item| item['itemprop']==nil}.each{
    |itemscope| 
    
    hashresults.merge!(analyseItemscopeMicroData(itemscope))
    
    }
    
    return hashresults
    
  end
  
  #Internal method that inspects the hierarchical structure of a itemscope
  def analyseItemscopeMicroData(itemscope)
    
      hashresults={}
      subclasses={}
      
      # Analyse subscopes
      itemscope.css('div').each do |itemprop|
      subclasses[itemprop['itemprop']]=analyseItemscopeMicroData(itemprop)
      end
    
      directproperties={}
      # Obtain direct properties of the main itemscope
      itemscope.css('span').each do |itemprop|
      directproperties[itemprop['itemprop']]=analysePropertieMicroData(itemprop)
      end
      
      # Merge filtered results
      hashresults["#{itemscope['itemtype']}"]=subclasses.merge(directproperties)
      return hashresults
  end
  
  # Internal method that inspects the values of final properties
    def analysePropertieMicroData(itemprop)
      itemprop.text
    end
  
end