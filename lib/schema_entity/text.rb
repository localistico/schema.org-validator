# Encoding: utf-8
module SchemaEntity
  # Module that represents the value Text
  module Text
    extend ActiveSupport::Concern
    include DataType
    include ActiveModel::Validations
    included do
      validates_type_of :value, with_type: String, allow_nil: true
    end
  end
end
