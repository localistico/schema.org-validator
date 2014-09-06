# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity OpeningHoursSpecification
  module OpeningHoursSpecification
    extend ActiveSupport::Concern
    include StructuredValue
    include ActiveModel::Validations
    included do
      schema_attr :closes, :opens,
                  type: { with_type: Time, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :day_of_week,
                  type: { with_type: DayOfWeek, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :valid_from, :valid_through,
                  type: { with_type: DateTime, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
