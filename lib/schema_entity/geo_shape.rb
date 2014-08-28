# Encoding: utf-8
require 'type_validator.rb'

module SchemaEntity
  # Module that represents the entity GeoShape
  module GeoShape
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :box, :circle, :elevation, :line, :polygon
      validates_type_of :box, :circle, :line, :polygon,
                        with_type: Text, allow_nil: true
      validates_type_of :elevation,
                        with_type: [Text, Number], allow_nil: true
    end
  end
end
