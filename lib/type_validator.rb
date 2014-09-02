# Encoding: utf-8
# Expected type validator
class TypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? && options[:allow_nil]
    record.errors[attribute] <<
      "expected to be #{options[:with_type]}}" unless
      same_type?(value)
  end
  # Iterates over the array of types for type-checking
  def same_type?(value)
    types = options[:with_type]
    types = [types] unless types.is_a?(Array)
    types.each do |type|
      return true if value.is_a? type
    end
    false
  end
end

module ActiveModel
  module Validations
    # Open Helpermethods module for adding new methods
    module HelperMethods
      # Allows validates_type_of sintaxis
      def validates_type_of(*attr_names)
        validates_with TypeValidator, _merge_attributes(attr_names)
      end
    end
  end
end
