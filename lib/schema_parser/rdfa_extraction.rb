# Encoding: utf-8
class SchemaParser
  # Class that extracts schema information of RDFa
  class RdfaExtraction
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
        analyse_maintypeof(typeof, hashresults)
      end
      hashresults
    end

    private

    # Internal method that inspects the hierarchical structure of the main type
    def analyse_maintypeof(typeof, hashresults)
      results = hashresults["#{@vocab}#{typeof['typeof']}"] || []
      results = [results] unless results.is_a?(Array)
      results << analyse_typeof_rdfa(typeof)["#{@vocab}#{typeof['typeof']}"]
      if results.size > 1
        hashresults["#{@vocab}#{typeof['typeof']}"] = results
      else
        hashresults["#{@vocab}#{typeof['typeof']}"] = results.first
      end
    end
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
        return property['datetime'] if property['datetime']
        property['href']
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
end
