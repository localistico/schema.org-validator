require 'type_validator.rb'

class SchemaEntity
  # Class that represents the entity LocalBusiness
  class LocalBusiness < Place
    include ActiveModel::Validations
    attr_accessor :branch_of, :currencies_accepted, :opening_hours, :payment_accepted, :price_range
    validates_presence_of :branch_of, :currencies_accepted, :opening_hours, :payment_accepted, :price_range
    validates_type_of :branch_of, with_type: Organization
    validates_type_of :currencies_accepted, :payment_accepted, :price_range, with_type: String
    validates_type_of :opening_hours, with_type: Duration
  end
end