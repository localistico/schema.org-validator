# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity FoodEstablishment
  module FoodEstablishment
    extend ActiveSupport::Concern
    include LocalBusiness
    include Organization
    include Thing
    include Place
    include ActiveModel::Validations
    included do
      attr_accessor :accepts_reservations, :menu,
                    :serves_cuisine
      validates_type_of :accepts_reservations,
                        with_type: [Boolean, URL, Text], allow_nil: true
      validates_type_of :menu,
                        with_type: [URL, Text], allow_nil: true
      validates_type_of :serves_cuisine,
                        with_type: Text, allow_nil: true
      validates_nested :accepts_reservations, :menu,
                       :serves_cuisine, allow_nil: true
    end
  end
end
