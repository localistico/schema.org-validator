# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity GeoShape
  module GeoShape
    extend ActiveSupport::Concern
    include StructuredValue
    include ActiveModel::Validations
    included do
      schema_attr :box, :circle, :line, :polygon,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :elevation,
                  type: { with_type: [Text, Number], allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
