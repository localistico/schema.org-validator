# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Map
  module Map
    extend ActiveSupport::Concern
    include CreativeWork
    include ActiveModel::Validations
    included do
      schema_attr :map_type,
                  type: { with_type: MapCategoryType, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
