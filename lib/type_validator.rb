# Encoding: utf-8
# Expected type validator
class TypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? && options[:allow_nil]
    record.errors[attribute] <<
      "expected to be #{options[:with_type]}}" unless
      value.is_a? options[:with_type]
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
