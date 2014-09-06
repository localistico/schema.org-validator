# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity GeoCoordinates
  module GeoCoordinates
    extend ActiveSupport::Concern
    include StructuredValue
    include ActiveModel::Validations
    included do
      schema_attr :elevation, :latitude, :longitude,
                  type: { with_type: [Text, Number], allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
