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
                          /\A(?x)^(\d{2}|\d{4})
                          ((-?)((0[1-9]|1[0-2])
                          (\3([12]\d|0[1-9]|3[01]))?
                          |W([0-4]\d|5[0-2])(-?[1-7])?
                          |(00[1-9]|0[1-9]\d|[12]\d{2}
                          |3([0-5]\d|6[1-6])))?)$\Z/i
    end
  end
end
