# Encoding: utf-8
require 'open-uri'

# Class that parses the HTML code of a webpage and extracts schema information
class HtmlParser
  # Accesible variables
  attr_reader :hash
  # This class needs the adress string of the webpage
  def initialize(webadress)
    @adress = webadress
    @page = Nokogiri::HTML(open(@adress))
    @hash = analyse_microdata
  end
  # HTML code of the webpage
  def inspect
    "Parser of #{@adress}:\n#{@page}"
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
    # Get the direct descendents
    partialresults = analyse_dirdescendants_microdata(itemscope)
    # Add tag if the item is a schema tag
    datatree_grow_microdata(itemscope, partialresults)
  end
  # Analyse subscope with mutual recursion
  def analyse_subscope_microdata(itemprop, partialresults)
    results = partialresults[itemprop['itemprop']] || []
    results = [results] unless results.is_a?(Array)
    results << analyse_itemscope_microdata(itemprop)
    if results.size > 1
      partialresults[itemprop['itemprop']] = results
    else
      partialresults[itemprop['itemprop']] = results.first
    end
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
      return itemprop['content'] if itemprop['content']
      itemprop['datetime']
    end
  end
  # Internal method that process direct properties
  def process_directpropertie(child, partialresults)
    results = partialresults[child['itemprop']] || []
    results = [results] unless results.is_a?(Array)
    results << analyse_dirpropertie_microdata(child)
    if results.size > 1
      partialresults[child['itemprop']] = results
    else
      partialresults[child['itemprop']] = results.first
    end
  end
  # Grow (or not) datatree depending on schema tag
  def datatree_grow_microdata(itemscope, partialresults)
    # Ensure the item is a schema tag
    if !(itemscope['itemtype'].to_s == '')
      # Add schema tag on hash
      hashresults = {}
      hashresults[itemscope['itemtype'].to_s] = partialresults
      hashresults
    else
      # If not, data tree doesn't grow
      partialresults
    end
  end
  # Analyse direct descendants
  def analyse_dirdescendants_microdata(itemscope)
    # Get the direct descendents
    partialresults = {}
    itemscope.children.each do |child|
      analyse_dirdescendant_microdata(child, partialresults)
    end
    partialresults
  end
  # Analyse direct descendant
  def analyse_dirdescendant_microdata(child, partialresults)
    # Analyse subscope
    if subscope?(child)
      analyse_subscope_microdata(child, partialresults)
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
end
