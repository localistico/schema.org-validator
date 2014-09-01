# Encoding: utf-8
module SchemaEntity
  # Module that represents the value Date
  module Date
    extend ActiveSupport::Concern
    include DataType
    include ActiveModel::Validations
    included do
      attr_accessor :value
      # ISO_8601 Date format regex
      validates_format_of :value,
                          with:
                          /(\d{4}(?:(?:(?:\-)?(?:00[1-9]
                          |0[1-9][0-9]|[1-2][0-9][0-9]|3[0-5]
                          [0-9]|36[0-6]))?|(?:(?:\-)?(?:1[0-2]
                          |0[1-9]))?|(?:(?:\-)?(?:1[0-2]|0[1-9])
                          (?:\-)?(?:0[1-9]|[12][0-9]|3[01]))?
                          |(?:(?:\-)?W(?:0[1-9]|[1-4][0-9]5[0-3]))
                          ?|(?:(?:\-)?W(?:0[1-9]|[1-4][0-9]5[0-3])
                          (?:\-)?[1-7])?)?)/
    end
  end
end
