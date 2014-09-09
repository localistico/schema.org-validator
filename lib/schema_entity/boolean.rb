# Encoding: utf-8
module SchemaEntity
  # Module that represents the value Boolean
  module Boolean
    extend ActiveSupport::Concern
    include DataType
    include ActiveModel::Validations
    included do
      validates :value,
                type: { with_type: [TrueClass, FalseClass] }
    end
  end
end
