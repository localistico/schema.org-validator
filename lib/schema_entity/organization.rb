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
      schema_attr :address,
                  type: { with_type: PostalAddress, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :aggregate_rating,
                  type: { with_type: AggregateRating, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :brand,
                  type: { with_type: [Organization, Brand], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :contact_point,
                  type: { with_type: ContactPoint, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :department, :member, :sub_organization,
                  type: { with_type: Organization, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :dissolution_date, :founding_date,
                  type: { with_type: Date, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :duns, :email, :fax_number, :global_location_number,
                  :interaction_count, :isic_v4, :legal_name, :naics,
                  :tax_id, :telephone, :vat_id,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :employee, :founder,
                  type: { with_type: Person, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :event,
                  type: { with_type: Event, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :has_pos,
                  type: { with_type: Place, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :location,
                  type: { with_type: [PostalAddress, Place], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :logo,
                  type: { with_type: [URL, ImageObject], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :makes_offer,
                  type: { with_type: Offer, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :member,
                  type: { with_type: [Person, Organization], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :member_of,
                  type: { with_type: [ProgramMemberShip, Organization],
                          allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :owns,
                  type: { with_type: [OwnershipInfo, Product],
                          allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :review,
                  type: { with_type: Review, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :seeks,
                  type: { with_type: Demand, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
