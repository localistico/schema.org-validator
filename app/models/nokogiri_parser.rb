# Encoding: utf-8
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Class that parses the HTML code of a webpage and extracts schema information
class HtmlParser
  # This class needs the adress string of the webpage
  def initialize(webadress)
    @adress = webadress
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
  def analyse_micro_data
    # Hash table of results
    hashresults = {}

    # Obtain all the schema main itemscopes
    css('[itemscope]:not([itemprop])').each do
      |itemscope|
      hashresults.merge!(analyse_itemscope_microdata(itemscope))
    end

    hashresults
  end

  # Internal method that inspects the hierarchical structure of a itemscope
  def analyse_itemscope_microdata(itemscope)
    partialresults = {}
    
    # Get the direct descendents
    itemscope.children.each do |child|
      # Analyse subscopes
      if is_subscope?(child)
        partialresults.merge!(analyse_subscope_microdata(child))
      else
        # Obtain direct properties of the main itemscope
        if is_directproperty?(child)
          partialresults.merge!(analyse_dirpropertie_microdata(child))
        else
          # Look for another properties covered by another kind of tags (like <h1>)
          partialresults.merge!(analyse_anotpropertie_microdata(child))
        end
      end
    end
    
    # Ensure the item is a schema tag
    if (!"#{itemscope['itemtype']}".eql?(''))
      # Merge filtered results
      hashresults = {}
      hashresults["#{itemscope['itemtype']}"] = partialresults
      hashresults
    else
      # If not, data tree doesn't grow
      partialresults
    end
  end
  # Analyse subscope with mutual recursion
  def analyse_subscope_microdata(itemprop)
    subclasses = {}
    subclasses[itemprop['itemprop']] = analyse_itemscope_microdata(itemprop)
    subclasses
  end

  # Search another properties of the itemscope
  def analyse_anotpropertie_microdata(child)
    hashmap = analyse_itemscope_microdata(child)
  end
  
  #Verify if an item is a subscope
  def is_subscope?(item)
    !item['itemscope'].nil?
  end
  
  #Verify if an item is a direct property
  def is_directproperty?(item)
    !item['itemprop'].nil? && !is_subscope?(item)
  end

  # Internal method that inspects the values of final properties
  def analyse_dirpropertie_microdata(itemprop)
    hash={}
    hash[itemprop['itemprop']] =
    itemprop.text.gsub(/[\n\r\t]/, '').gsub(/\s\s*/, ' ').rstrip.lstrip
    hash
  end
end
