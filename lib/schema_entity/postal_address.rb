# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity PostalAddress
  module PostalAddress
    extend ActiveSupport::Concern
    include ContactPoint
    include ActiveModel::Validations
    included do
      schema_attr :address_country,
                  type: { with_type: Country, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :address_locality, :address_region,
                  :post_office_box_number, :postal_code, :street_address,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
