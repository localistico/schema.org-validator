# Encoding: utf-8
require 'failures_validator.rb'

# Module that represents any kind of Entity
module SchemaEntity
  # Base class of schema tags entities
  class Base
    include ActiveModel::Validations
    # Add attributes and validations if they aren't defined yet
    def self.schema_attr(*attributes)
      validators = attributes.reject { |attr| attr.is_a? Symbol }
      attributes.select { |attr| attr.is_a? Symbol }.each do |att|
        next if instance_methods.include?(att)
        attr_accessor att
        validators.each do |val|
          validates att, val
        end
      end
    end
    # Initialize the class with its properties
    def initialize(properties = {})
      properties.each do |key, value|
        begin
          send(:"#{key}=", value)
        rescue NoMethodError
          # Property doesn't exist
          @failures ||= {}
          @failures[key] = "property doesn't exist"
        end
      end
    end
  end
end
