# Encoding: utf-8
require 'array_validator.rb'

# Module that parses plain hash into schema's entities hash
module SchemaConverter
  extend ActiveSupport::Concern
  include ActiveModel::Validations
  included do
    attr_reader :conversion
    validates_array :conversion, allow_nil: true
  end
  # Schema tags' regular expression
  SCHEMA_REGEX = %r{\Ahttps?://(www.)?schema.org/}
  def initialize(arguments = {})
    @conversion = analyse_main_items(arguments)
  end

  private

  # Analyse any type of data
  def analyse_data(data)
    return analyse_hash(data) if data.is_a?(Hash)
    return analyse_array(data) if data.is_a?(Array)
    return analyse_direct_data(data) if direct_data?(data)
  end
  # Analyse main objects
  def analyse_main_items(hash)
    result = []
    hash.each do |key, value|
      result << Kernel.const_get("#{key.sub(SCHEMA_REGEX, '')}Entity")
      .new(analyse_data(value)) if schema_url?(key)
    end
    result
  end
  # Analyse hash of data
  def analyse_hash(hash)
    result = {}
    hash.each do |key, value|
      return Kernel.const_get("#{key.sub(SCHEMA_REGEX, '')}Entity")
      .new(analyse_data(value)) if schema_url?(key)
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
  # Analyse final data
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
