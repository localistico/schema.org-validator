# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity PostalAddress
  module PostalAddress
    extend ActiveSupport::Concern
    include ContactPoint
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :address_country, :address_locality, :address_region,
                    :post_office_box_number, :postal_code, :street_address
      validates_type_of :address_country, with_type: Country, allow_nil: true
      validates_type_of :address_locality, :address_region,
                        :post_office_box_number, :postal_code, :street_address,
                        with_type: Text, allow_nil: true
      validates_nested :address_country, :address_locality, :address_region,
                       :post_office_box_number, :postal_code, :street_address,
                       allow_nil: true
    end
  end
end
