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
      attr_accessor :attendee, :door_time, :duration, :end_date,
                    :event_status, :location, :offers, :organizer, :performer,
                    :previous_start_date, :start_date, :sub_event, :super_event,
                    :typical_age_range, :work_performed
      validates_type_of :attendee, :organizer, :performer,
                        with_type: [Person, Organization], allow_nil: true
      validates_type_of :door_time, with_type: DateTime, allow_nil: true
      validates_type_of :duration, with_type: Duration, allow_nil: true
      validates_type_of :end_date, :previous_start_date, :start_date,
                        with_type: Date, allow_nil: true
      validates_type_of :event_status,
                        with_type: EventStatusType, allow_nil: true
      validates_type_of :location,
                        with_type: [PostalAddress, Place], allow_nil: true
      validates_type_of :offers, with_type: Offer, allow_nil: true
      validates_type_of :sub_event, :super_event,
                        with_type: Event, allow_nil: true
      validates_type_of :typical_age_range, with_type: Text, allow_nil: true
      validates_type_of :work_Performed,
                        with_type: CreativeWork, allow_nil: true
      validates_nested :attendee, :door_time, :duration, :end_date,
                       :event_status, :location, :offers, :organizer,
                       :performer, :previous_start_date, :start_date,
                       :sub_event, :super_event,
                       :typical_age_range, :work_performed, allow_nil: true
    end
  end
end
