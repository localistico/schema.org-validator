# Encoding: utf-8
require 'type_validator.rb'

module SchemaEntity
  # Module that represents the entity GeoCoordinates
  module GeoCoordinates
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :elevation, :latitude, :longitude
      validates_type_of :elevation, :latitude, :longitude,
                        with_type: [Text, Number], allow_nil: true
    end
  end
end
