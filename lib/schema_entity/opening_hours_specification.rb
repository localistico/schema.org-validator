# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity OpeningHoursSpecification
  module OpeningHoursSpecification
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :closes, :day_of_week, :opens,
                    :valid_from, :valid_through
      validates_type_of :closes, :opens,
                        with_type: Time, allow_nil: true
      validates_type_of :day_of_week,
                        with_type: DayOfWeek, allow_nil: true
      validates_type_of :valid_from, :valid_through,
                        with_type: DateTime, allow_nil: true
      validates_nested :closes, :day_of_week, :opens,
                       :valid_from, :valid_through, allow_nil: true
    end
  end
end
