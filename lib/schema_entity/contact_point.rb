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
      attr_accessor :area_served, :available_language,
                    :contact_option, :contact_type, :email,
                    :fax_number, :hours_available,
                    :product_supported, :telephone
      validates_type_of :area_served,
                        with_type: AdministrativeArea, allow_nil: true
      validates_type_of :available_language,
                        with_type: Language, allow_nil: true
      validates_type_of :contact_option,
                        with_type: ContactPointOption, allow_nil: true
      validates_type_of :contact_type, :email, :fax_number, :telephone,
                        with_type: Text, allow_nil: true
      validates_type_of :hours_available,
                        with_type: OpeningHoursSpecification, allow_nil: true
      validates_type_of :product_supported,
                        with_type: [Product, Text], allow_nil: true
      validates_nested :area_served, :available_language,
                       :contact_option, :contact_type, :email,
                       :fax_number, :hours_available,
                       :product_supported, :telephone, allow_nil: true
    end
  end
end
