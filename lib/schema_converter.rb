# Class that parses plain hash into schema's entities hash
class SchemaConverter
  attr_reader :conversion
  def initialize(arguments={})
    @conversion = analyse_data(arguments)
  end
  # Analyse any type of data
  def analyse_data(data)
    return analyse_hash(data) if data.is_a?(Hash)
    return analyse_array(data) if data.is_a?(Array)
    return analyse_direct_data(data) if direct_data?(data)
  end
  # Analyse hash of data
  def analyse_hash(hash)
    result = {}
    hash.each do |key, value|
      return Kernel.const_get("#{key.sub(%r{\Ahttps?://(www.)?schema.org/},'')}Entity").new(analyse_data(value)) if schema_url?(key)
      result[key.underscore.to_sym] = analyse_data(value)
    end
    result
  end
  # Analyse array of elements
  def analyse_array(array)
    result = []
    array.each do |item|
      result << analyse_data(item)
    end
    result
  end
  def analyse_direct_data(data)
    TextEntity.new(value: data)
  end
  # Check if a string is a tag name
  def schema_url?(item)
    %r{\Ahttps?://(www.)?schema.org/[a-zA-Z]+\Z}.match(item)
  end
  # Check if it's a simple data
  def direct_data?(data)
    data.is_a? String
  end
end