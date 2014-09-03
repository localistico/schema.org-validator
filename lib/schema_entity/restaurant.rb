# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Restaurant
  module Restaurant
    extend ActiveSupport::Concern
    include FoodEstablishment
    include LocalBusiness
    include Organization
    include Thing
    include Place
    include ActiveModel::Validations
    included do
    end
  end
end
