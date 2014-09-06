# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity FoodEstablishment
  module FoodEstablishment
    extend ActiveSupport::Concern
    include LocalBusiness
    include ActiveModel::Validations
    included do
      schema_attr :accepts_reservations,
                  type: { with_type: [Boolean, URL, Text], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :menu,
                  type: { with_type: [URL, Text], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :serves_cuisine,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
