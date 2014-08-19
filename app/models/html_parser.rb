# Encoding: utf-8
require 'open-uri'

# Class that parses the HTML code of a webpage and extracts schema information
class HtmlParser
  # Accesible variables
  attr_reader :hash
  # This class needs the adress string of the webpage
  def initialize(webadress)
    @address = webadress
    @page = Nokogiri::HTML(open(@address))
    @hash = analyse_data
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

  # Decide how to analyse the HTML structure
  def analyse_data
    if css('[itemscope]:not([itemprop])').size > 0
      MicrodataExtraction.new(@page).analyse_data
    else
      RDFaExtraction.new(@page).analyse_data
    end
  end
end
# Class that extracts schema information of Microdata
class MicrodataExtraction
  # This class needs Nokogiri's HTML object
  def initialize(page)
    @page = page
  end
  # CSS method filters tags
  def css(string)
    @page.css(string)
  end
  # CSS method that builds the hierarchical structure of the tags in MicroData
  def analyse_data
    # Hash table of results
    hashresults = {}
    # Obtain all the schema main itemscopes
    css('[itemscope]:not([itemprop])').each do |itemscope|
      hashresults.merge!(analyse_itemscope_microdata(itemscope))
    end
    hashresults
  end

  private

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
  # Verify if an item is a direct microdata property
  def microdata_directproperty?(item)
    !item['itemprop'].nil? && !subscope?(item)
  end
  # Internal method that inspects the values of final microdata properties
  def analyse_dirpropertie_microdata(itemprop)
    if !itemprop.text.eql?('')
      itemprop.text.gsub(/[\n\r\t]/, '').gsub(/\s\s*/, ' ').rstrip.lstrip
    else
      return itemprop['content'] if itemprop['content']
      itemprop['datetime']
    end
  end
  # Internal method that process microdata direct properties
  def process_directpropertie_microdata(child, partialresults)
    results = partialresults[child['itemprop']] || []
    results = [results] unless results.is_a?(Array)
    results << analyse_dirpropertie_microdata(child)
    if results.size > 1
      partialresults[child['itemprop']] = results
    else
      partialresults[child['itemprop']] = results.first
    end
  end
  # Grow (or not) datatree depending on microdata's schema tag
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
  # Analyse Microdata's direct descendants
  def analyse_dirdescendants_microdata(itemscope)
    # Get the direct descendents
    partialresults = {}
    itemscope.children.each do |child|
      analyse_dirdescendant_microdata(child, partialresults)
    end
    partialresults
  end
  # Analyse microdata's direct descendant
  def analyse_dirdescendant_microdata(child, partialresults)
    # Analyse subscope
    if subscope?(child)
      analyse_subscope_microdata(child, partialresults)
    else
      # Obtain direct properties of the main itemscope
      if microdata_directproperty?(child)
        process_directpropertie_microdata(child, partialresults)
      else
        # Look for another properties covered by another kind of tags (<h1>)
        partialresults.merge!(analyse_anotpropertie_microdata(child))
      end
    end
  end
end
# Class that extracts schema information of RDFa
class RDFaExtraction
  # This class needs Nokogiri's HTML object
  def initialize(page)
    @page = page
    @vocab = 'http://schema.org/'
  end
  # CSS method filters tags
  def css(string)
    @page.css(string)
  end
  # CSS method that builds the hierarchical structure of the tags in RDFa
  def analyse_data
    # Hash table of results
    hashresults = {}
    # Obtain all the schema main types
    css("[vocab='#{@vocab}']:not([property])").each do |typeof|
      hashresults.merge!(analyse_typeof_rdfa(typeof))
    end
    hashresults
  end

  private

  # Internal method that inspects the hierarchical structure of a type
  def analyse_typeof_rdfa(typeof)
    # Get the direct descendents
    partialresults = analyse_dirdescendants_rdfa(typeof)
    # Add tag if the item is a schema tag
    datatree_grow_rdfa(typeof, partialresults)
  end
  # Analyse subtype with mutual recursion
  def analyse_subtype_rdfa(property, partialresults)
    results = partialresults[property['property']] || []
    results = [results] unless results.is_a?(Array)
    results << analyse_typeof_rdfa(property)
    if results.size > 1
      partialresults[property['property']] = results
    else
      partialresults[property['property']] = results.first
    end
  end
  # Search another properties of the typeof
  def analyse_anotpropertie_rdfa(child)
    analyse_typeof_rdfa(child)
  end
  # Verify if an item is a subtype
  def subtype?(item)
    !item['typeof'].nil?
  end
  # Verify if an item is a direct rdfa property
  def rdfa_directproperty?(item)
    !item['property'].nil? && !subtype?(item)
  end
  # Internal method that inspects the values of final rdfa properties
  def analyse_dirpropertie_rdfa(property)
    if !property.text.eql?('')
      property.text.gsub(/[\n\r\t]/, '').gsub(/\s\s*/, ' ').rstrip.lstrip
    else
      return property['content'] if property['content']
      property['datetime']
    end
  end
  # Internal method that process rdfa direct properties
  def process_directpropertie_rdfa(child, partialresults)
    results = partialresults[child['property']] || []
    results = [results] unless results.is_a?(Array)
    results << analyse_dirpropertie_rdfa(child)
    if results.size > 1
      partialresults[child['property']] = results
    else
      partialresults[child['property']] = results.first
    end
  end
  # Grow (or not) datatree depending on RDFA's schema tag
  def datatree_grow_rdfa(typeof, partialresults)
    # Ensure the item is a schema tag
    if !(typeof['typeof'].to_s == '')
      # Add schema tag on hash
      hashresults = {}
      hashresults["#{@vocab}#{typeof['typeof']}"] = partialresults
      hashresults
    else
      # If not, data tree doesn't grow
      partialresults
    end
  end
  # Analyse RDFA's direct descendants
  def analyse_dirdescendants_rdfa(typeof)
    # Get the direct descendents
    partialresults = {}
    typeof.children.each do |child|
      analyse_dirdescendant_rdfa(child, partialresults)
    end
    partialresults
  end
  # Analyse rdfa's direct descendant
  def analyse_dirdescendant_rdfa(child, partialresults)
    # Analyse subscope
    if subtype?(child)
      analyse_subtype_rdfa(child, partialresults)
    else
      # Obtain direct properties of the main itemscope
      if rdfa_directproperty?(child)
        process_directpropertie_rdfa(child, partialresults)
      else
        # Look for another properties covered by another kind of tags (<h1>)
        partialresults.merge!(analyse_anotpropertie_rdfa(child))
      end
    end
  end
end
