# Encoding: utf-8
module SchemaEntity
  # Module that represents any kind of Data
  module DataType
    extend ActiveSupport::Concern
    include SchemaEntity
    include ActiveModel::Validations
    included do
      schema_attr :value
    end
  end
end
