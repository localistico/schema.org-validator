# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Place
  module Place
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
      schema_attr :event,
                  type: { with_type: Event, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :fax_number, :global_location_number,
                  :interaction_count, :isic_v4, :telephone,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :geo,
                  type: { with_type: [GeoShape, GeoCoordinates],
                          allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :has_map,
                  type: { with_type: [URL, Map], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :logo,
                  type: { with_type: [URL, ImageObject], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :opening_hours_specification,
                  type: { with_type: OpeningHoursSpecification,
                          allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :photo,
                  type: { with_type: [ImageObject, Photograph],
                          allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :review,
                  type: { with_type: Review, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
