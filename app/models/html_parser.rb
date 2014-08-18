# Encoding: utf-8
require 'open-uri'

# Class that parses the HTML code of a webpage and extracts schema information
class HtmlParser
  # This class needs the adress string of the webpage
  def initialize(webadress)
    @adress = webadress
    begin
      @page = Nokogiri::HTML(open(@adress))
      @hash = analyse_microdata
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
  
  # Hash parsed
  def hash
    @hash
  end
  
  # Method that inspects the parsed hash
  def [](name)
    @hash[name]
  end

private
  # CSS method that builds the hierarchical structure of the tags in MicroData
  def analyse_microdata
    # Hash table of results
    hashresults = {}

    # Obtain all the schema main itemscopes
    css('[itemscope]:not([itemprop])').each do |itemscope|
      hashresults.merge!(analyse_itemscope_microdata(itemscope))
    end

    hashresults
  end

  # Internal method that inspects the hierarchical structure of a itemscope
  def analyse_itemscope_microdata(itemscope)
    partialresults = {}
    # Get the direct descendents
    itemscope.children.each do |child|
      # Analyse subscope
      if subscope?(child)
        partialresults.merge!(analyse_subscope_microdata(child))
      else
        # Obtain direct properties of the main itemscope
        if directproperty?(child)
          process_directpropertie(child, partialresults)
        else
          # Look for another properties covered by another kind of tags (<h1>)
          partialresults.merge!(analyse_anotpropertie_microdata(child))
        end
      end
    end
    # Ensure the item is a schema tag
    if !(itemscope['itemtype'].to_s == '')
      # Merge filtered results
      hashresults = {}
      hashresults[itemscope['itemtype'].to_s] = partialresults
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
    analyse_itemscope_microdata(child)
  end
  # Verify if an item is a subscope
  def subscope?(item)
    !item['itemscope'].nil?
  end
  # Verify if an item is a direct property
  def directproperty?(item)
    !item['itemprop'].nil? && !subscope?(item)
  end

  # Internal method that inspects the values of final properties
  def analyse_dirpropertie_microdata(itemprop)
    if !itemprop.text.eql?('')
      itemprop.text.gsub(/[\n\r\t]/, '').gsub(/\s\s*/, ' ').rstrip.lstrip
    else
      itemprop['content']
    end
  end
  # Internal method that process direct properties
  def process_directpropertie(child, partialresults)
    # There is already one or more attributes of this property
    if partialresults[child['itemprop']]
      # There is already an array of this property
      if partialresults[child['itemprop']].is_a?(Array)
        partialresults[child['itemprop']] =
        partialresults[child['itemprop']] <<
        (analyse_dirpropertie_microdata(child))
      else
        # There is only one attribute
        array = []
        array << partialresults[child['itemprop']]
        array << analyse_dirpropertie_microdata(child)
        partialresults[child['itemprop']] = array
      end
    else
      partialresults[child['itemprop']] =
      (analyse_dirpropertie_microdata(child))
    end
  end
end
