# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity DayOfWeek
  module DayOfWeek
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :value
      validates_format_of :value,
                          with:
                          /\A(?x)^http:\/\/purl.org\/
                          goodrelations\/v1#
                          (Monday|Tuesday|Wednesday
                          |Thursday|Friday|Saturday
                          |Sunday|PublicHolidays)
                          \Z/i
    end
  end
end
