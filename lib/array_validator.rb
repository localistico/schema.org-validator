# Encoding: utf-8
# Validates array of Schema Objects
class ArrayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? && options[:allow_nil]
    if value.nil? || value.empty?
      record.errors[attribute] << 'No data found'
    else
      value.each do |object|
        record.errors[object.class.name] <<
          object.errors.messages unless object.valid?
      end
    end
  end
end

module ActiveModel
  module Validations
    # Open Helpermethods module for adding new methods
    module HelperMethods
      # Allows validates_array sintaxis
      def validates_array(*attr_names)
        validates_with ArrayValidator, _merge_attributes(attr_names)
      end
    end
  end
end
