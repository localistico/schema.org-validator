# Encoding: utf-8
module SchemaEntity
  # Class that represents the entity ContactPoint
  module ContactPoint
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :area_served, :available_language,
                    :contact_option, :contact_type, :email,
                    :fax_number, :hours_available,
                    :product_supported, :telephone
      validates_type_of :area_served,
                        with_type: AdministrativeArea, allow_nil: true
    end
  end
end
