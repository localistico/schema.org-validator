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
      attr_accessor :address, :aggregate_rating, :contained_in, :event,
                    :fax_number, :geo, :global_location_number,
                    :has_map, :interaction_count, :isic_v4, :logo,
                    :opening_hours_specification, :photo, :review, :telephone
      validates_type_of :address, with_type: PostalAddress,
                                  allow_nil: true
      validates_type_of :aggregate_rating, with_type: AggregateRating,
                                           allow_nil: true
      validates_type_of :event, with_type: Event, allow_nil: true
      validates_type_of :fax_number, :global_location_number,
                        :interaction_count, :isic_v4, :telephone,
                        with_type: Text, allow_nil: true
      validates_type_of :geo, with_type: [GeoShape, GeoCoordinates],
                              allow_nil: true
      validates_type_of :has_map, with_type: [URL, Map], allow_nil: true
      validates_type_of :logo, with_type: [URL, ImageObject], allow_nil: true
      validates_type_of :opening_hours_specification,
                        with_type: OpeningHoursSpecification, allow_nil: true
      validates_type_of :photo, with_type: [ImageObject, Photograph],
                                allow_nil: true
      validates_type_of :review, with_type: Review, allow_nil: true
      validates_nested :address, :aggregate_rating, :contained_in, :event,
                       :fax_number, :geo, :global_location_number,
                       :has_map, :interaction_count, :isic_v4, :logo,
                       :opening_hours_specification, :photo, :review,
                       :telephone, allow_nil: true
    end
  end
end
