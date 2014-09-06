# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Review
  module Review
    extend ActiveSupport::Concern
    include CreativeWork
    include ActiveModel::Validations
    included do
      schema_attr :item_reviewed,
                  type: { with_type: Thing, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :review_body,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :review_rating,
                  type: { with_type: Rating, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
