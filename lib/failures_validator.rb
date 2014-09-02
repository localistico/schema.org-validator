# Encoding: utf-8
# Ensures failures' variable is empty
class FailuresValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    return if value.nil?
    value.each do |key, error|
      record.errors[key] << error
    end
  end
end

module ActiveModel
  module Validations
    # Open Helpermethods module for adding new methods
    module HelperMethods
      # Allows validates_type_of sintaxis
      def validates_failures_of(*attr_names)
        validates_with FailuresValidator, _merge_attributes(attr_names)
      end
    end
  end
end
