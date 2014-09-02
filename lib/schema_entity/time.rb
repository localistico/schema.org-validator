# Encoding: utf-8
module SchemaEntity
  # Module that represents the value Time
  module Time
    extend ActiveSupport::Concern
    include DataType
    include ActiveModel::Validations
    included do
      validates_format_of :value,
                          with:
                          /\A(?x)(2[0-3]|[01][0-9]):?
                          ([0-5][0-9]):?([0-5][0-9])
                          ((Z|[+-](?:2[0-3]|[01][0-9])
                          (?::?(?:[0-5][0-9]))?)?)\Z/i
    end
  end
end
