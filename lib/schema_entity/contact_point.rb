# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity ContactPoint
  module ContactPoint
    extend ActiveSupport::Concern
    include StructuredValue
    include ActiveModel::Validations
    included do
      schema_attr :area_served,
                  type: { with_type: AdministrativeArea, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :available_language,
                  type: { with_type: Language, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :contact_option,
                  type: { with_type: ContactPointOption, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :contact_type, :email, :fax_number, :telephone,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :hours_available,
                  type: { with_type: OpeningHoursSpecification,
                          allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :product_supported,
                  type: { with_type: [Product, Text], allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
