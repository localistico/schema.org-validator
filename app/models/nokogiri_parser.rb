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
    css('[itemscope]').select { |item| item['itemprop'].nil? }.each do
      |itemscope|
      hashresults.merge!(analyse_itemscope_microdata(itemscope))
    end

    hashresults
  end

  # Internal method that inspects the hierarchical structure of a itemscope
  def analyse_itemscope_microdata(itemscope)
    hashresults = {}

    # Analyse subscopes
    subclasses = analyse_subscopes_microdata(itemscope)

    # Obtain direct properties of the main itemscope
    directproperties = analyse_dirproperties_microdata(itemscope)

    # Merge filtered results
    hashresults["#{itemscope['itemtype']}"] =
    subclasses.merge(directproperties)
    hashresults
  end
  # Analyse subscopes with mutual recursion
  def analyse_subscopes_microdata(itemscope)
    subclasses = {}
    itemscope.css('> [itemscope]').each do |itemprop|
      subclasses[itemprop['itemprop']] = analyse_itemscope_microdata(itemprop)
    end
    subclasses
  end
  # Obtain direct properties of the main itemscope
  def analyse_dirproperties_microdata(itemscope)
    directproperties = {}
    itemscope.css('> [itemprop]').select { |it| it['itemscope'].nil? }.each do
      |itemprop|
      directproperties[itemprop['itemprop']] =
        analyse_propertie_microdata(itemprop)
    end
    directproperties
  end

  # Internal method that inspects the values of final properties
  def analyse_propertie_microdata(itemprop)
    itemprop.text.gsub(/[\n\r\t]/, '').gsub(/\s\s*/, ' ').rstrip.lstrip
  end
end
