# Expected type validator
class TypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.is_a? options[:with_type]
      record.errors[attribute] << "expected to be #{options[:with_type]}}"
    end
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      # Allows validates_type_of sintaxis
      def validates_type_of(*attr_names)
        validates_with TypeValidator, _merge_attributes(attr_names)
      end
    end
  end
end