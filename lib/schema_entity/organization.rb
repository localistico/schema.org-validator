# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Organization
  module Organization
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :address, :aggregate_rating, :brand,
                    :contact_point, :department, :dissolution_date,
                    :duns, :email, :employee, :event, :fax_number,
                    :founder, :founding_date, :global_location_number,
                    :has_pos, :interaction_count, :isic_v4, :legal_name,
                    :location, :logo, :makes_offer, :member, :member_of,
                    :naics, :owns, :review, :seeks, :sub_organization,
                    :tax_id, :telephone, :vat_id
      validates_type_of :address,
                        with_type: PostalAddress, allow_nil: true
      validates_type_of :aggregate_rating,
                        with_type: AggregateRating, allow_nil: true
      validates_type_of :brand,
                        with_type:
                        [Organization, Brand], allow_nil: true
      validates_type_of :contact_point,
                        with_type: ContactPoint, allow_nil: true
      validates_type_of :department, :member, :sub_organization,
                        with_type: Organization, allow_nil: true
      validates_type_of :dissolution_date, :founding_date,
                        with_type: Date, allow_nil: true
      validates_type_of :duns, :email, :fax_number, :global_location_number,
                        :interaction_count, :isic_v4, :legal_name, :naics,
                        :tax_id, :telephone, :vat_id,
                        with_type: Text, allow_nil: true
      validates_type_of :employee, :founder,
                        with_type: Person, allow_nil: true
      validates_type_of :event,
                        with_type: Event, allow_nil: true
      validates_type_of :has_pos,
                        with_type: Place, allow_nil: true
      validates_type_of :location,
                        with_type:
                        [PostalAddress, Place], allow_nil: true
      validates_type_of :logo,
                        with_type: [URL, ImageObject], allow_nil: true
      validates_type_of :makes_offer,
                        with_type: Offer, allow_nil: true
      validates_type_of :member,
                        with_type:
                        [Person, Organization], allow_nil: true
      validates_type_of :member_of,
                        with_type:
                        [ProgramMemberShip, Organization], allow_nil: true
      validates_type_of :owns,
                        with_type: [OwnershipInfo, Product], allow_nil: true
      validates_type_of :review,
                        with_type: Review, allow_nil: true
      validates_type_of :seeks,
                        with_type: Demand, allow_nil: true
      validates_nested :address, :aggregate_rating, :brand,
                       :contact_point, :department, :dissolution_date,
                       :duns, :email, :employee, :event, :fax_number,
                       :founder, :founding_date, :global_location_number,
                       :has_pos, :interaction_count, :isic_v4, :legal_name,
                       :location, :logo, :makes_offer, :member, :member_of,
                       :naics, :owns, :review, :seeks, :sub_organization,
                       :tax_id, :telephone, :vat_id, allow_nil: true
    end
  end
end
