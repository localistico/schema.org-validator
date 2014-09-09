# Encoding: utf-8
require 'open-uri'

# Class that parses the HTML code of a webpage and extracts schema information
class SchemaParser
  # Accessible variables
  attr_reader :hash
  # This class needs the address string of the webpage
  def initialize(webaddress)
    @address = webaddress
    @page = Nokogiri::HTML(open(@address))
    @hash = analyse_data
  end
  # HTML code of the webpage
  def inspect
    "Parser of #{@address}:\n#{@page}"
  end
  # CSS method filters tags
  def css(string)
    @page.css(string)
  end
  # Method that inspects the parsed hash
  def [](name)
    @hash[name]
  end

  private

  # Decide how to analyse the HTML structure
  def analyse_data
    if css('[itemscope]:not([itemprop])').size > 0
      MicrodataExtraction.new(@page).analyse_data
    else
      RdfaExtraction.new(@page).analyse_data
    end
  end
end
