# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity LocalBusiness
  module LocalBusiness
    extend ActiveSupport::Concern
    include Place
    include Organization
    include ActiveModel::Validations
    # Method called when other module of method included it
    included do
      schema_attr :branch_of,
                  type: { with_type: Organization, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :currencies_accepted, :payment_accepted, :price_range,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :opening_hours,
                  type: { with_type: Duration, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
