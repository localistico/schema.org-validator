# Class that extracts schema information of Microdata
class SchemaParser::MicrodataExtraction
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
      analyse_mainitemscope(itemscope, hashresults)
    end
    hashresults
  end

  private

  # Internal method that inspects the structure of the main itemscope
  def analyse_mainitemscope(itemscope, hashresults)
    results = hashresults[itemscope['itemtype']] || []
    results = [results] unless results.is_a?(Array)
    results << analyse_itemscope_microdata(itemscope)[itemscope['itemtype']]
    if results.size > 1
      hashresults[itemscope['itemtype']] = results
    else
      hashresults[itemscope['itemtype']] = results.first
    end
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
      return itemprop['datetime'] if itemprop['datetime']
      itemprop['href']
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