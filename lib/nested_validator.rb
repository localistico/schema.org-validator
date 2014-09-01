# Encoding: utf-8
# Validates nested objects
class NestedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? && options[:allow_nil]
    if value.nil?
      record.errors[attribute] << 'Cannot be nil'
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
