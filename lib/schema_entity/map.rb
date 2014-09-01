# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Map
  module Map
    extend ActiveSupport::Concern
    include CreativeWork
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :map_type
      validates_type_of :map_type,
                        with_type: MapCategoryType, allow_nil: true
      validates_nested :map_type, allow_nil: true
    end
  end
end
