# Encoding: utf-8
# Validates nested objects
class NestedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? && options[:allow_nil]
    if value.nil?
      record.errors[attribute] << 'Cannot be nil'
    else
      validation(record, attribute, value)
    end
  end
  # Validates single element or array of Schema's entities
  def validation(record, attribute, value)
    if value.is_a?(Array)
      value.each do |object|
        record.errors[object] <<
          object.errors.messages unless object.valid?
      end
      else
        record.errors[attribute] <<
          value.errors.messages unless value.valid?
    end
  end
end

module ActiveModel
  module Validations
    # Open Helpermethods module for adding new methods
    module HelperMethods
      # Allows validates_nested sintaxis
      def validates_nested(*attr_names)
        validates_with NestedValidator, _merge_attributes(attr_names)
      end
    end
  end
end
