# Encoding: utf-8
module SchemaEntity
  # Module that represents the value Datetime
  module DateTime
    extend ActiveSupport::Concern
    include DataType
    include ActiveModel::Validations
    included do
    end
  end
end
