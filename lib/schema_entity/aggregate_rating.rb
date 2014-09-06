# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity AggregateRating
  module AggregateRating
    extend ActiveSupport::Concern
    include Rating
    include ActiveModel::Validations
    included do
      schema_attr :item_reviewed,
                  type: { with_type: Thing, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :rating_count, :review_count,
                  type: { with_type: Number, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
