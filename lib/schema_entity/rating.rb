# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Rating
  module Rating
    extend ActiveSupport::Concern
    include Intangible
    include ActiveModel::Validations
    included do
      schema_attr :best_rating, :worst_rating,
                  type: { with_type: [Text, Number], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :rating_value,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true },
                  presence: {}
    end
  end
end
