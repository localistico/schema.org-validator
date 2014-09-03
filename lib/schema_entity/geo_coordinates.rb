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
      attr_accessor :elevation, :latitude, :longitude
      validates_type_of :elevation, :latitude, :longitude,
                        with_type: [Text, Number], allow_nil: true
      validates_nested :elevation, :latitude, :longitude,
                       allow_nil: true
    end
  end
end
