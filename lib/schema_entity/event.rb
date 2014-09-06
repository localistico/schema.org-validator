# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Event
  module Event
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      schema_attr :attendee, :organizer, :performer,
                  type: { with_type: [Person, Organization], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :door_time,
                  type: { with_type: DateTime, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :duration,
                  type: { with_type: Duration, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :end_date, :previous_start_date, :start_date,
                  type: { with_type: Date, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :event_status,
                  type: { with_type: EventStatusType, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :location,
                  type: { with_type: [PostalAddress, Place], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :offers,
                  type: { with_type: Offer, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :sub_event, :super_event,
                  type: { with_type: Event, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :typical_age_range,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :work_Performed,
                  type: { with_type: CreativeWork, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
