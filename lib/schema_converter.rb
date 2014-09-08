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
  def analyse_data(data, tagname = '')
    return analyse_hash(data) if data.is_a?(Hash)
    return analyse_array(data, tagname) if data.is_a?(Array)
    return analyse_direct_data(data, tagname) if direct_data?(data)
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
      .new(analyse_data(value, key)) if schema_url?(key)
      result[key.underscore.to_sym] = analyse_data(value, key)
    end
    result
  end
  # Analyse array of elements
  def analyse_array(array, tagname)
    result = []
    array.each do |item|
      result << analyse_data(item, tagname)
    end
    result
  end
  # Analyse final data
  def analyse_direct_data(data, tagname)
    tag = tagname.underscore.to_sym
    return BooleanEntity.new(value: data) if boolean?(data)
    return NumberEntity.new(value: data) if number?(data)
    val = check_tag_name(tag)
    return Kernel.const_get("#{val}Entity").new(value: data) if val
    TextEntity.new(value: data)
  end
  # Check if a tag name is of some type declared in SchemaNames
  def check_tag_name(data)
    SchemaEntity::SchemaNames.days_of_week
    .merge!(SchemaEntity::SchemaNames.date_times)
    .merge!(SchemaEntity::SchemaNames.dates)
    .merge!(SchemaEntity::SchemaNames.durations)
    .merge!(SchemaEntity::SchemaNames.times)
    .merge!(SchemaEntity::SchemaNames.urls).each do |key, value|
      return key if value.include?(data)
    end
    nil
  end
  # Check if a string is a tag name
  def schema_url?(item)
    %r{\Ahttps?://(www.)?schema.org/[a-zA-Z]+\Z}.match(item)
  end
  # Check if it's a simple data
  def direct_data?(data)
    data.is_a? String
  end
  # Check if a string represents a boolean type
  def boolean?(data)
    data.downcase.eql?('true') || data.downcase.eql?('false')
  end
  # Check if a string represents a number
  def number?(data)
    return true if data =~ /^\d+$/
    begin
      true if Float(data)
    rescue
      false
    end
  end
end
