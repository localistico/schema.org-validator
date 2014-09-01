# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity LocalBusiness
  module LocalBusiness
    extend ActiveSupport::Concern
    include Place
    include Organization
    include Thing
    include ActiveModel::Validations
    # Method called when other module of method included it
    included do
      attr_accessor :branch_of, :currencies_accepted, :opening_hours,
                    :payment_accepted, :price_range
      validates_type_of :branch_of, with_type: Organization, allow_nil: true
      validates_type_of :currencies_accepted, :payment_accepted, :price_range,
                        with_type: Text, allow_nil: true
      validates_type_of :opening_hours, with_type: Duration, allow_nil: true
      validates_nested :branch_of, :currencies_accepted, :opening_hours,
                       :payment_accepted, :price_range, allow_nil: true
    end
  end
end
