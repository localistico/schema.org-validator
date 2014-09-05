# Encoding: utf-8
module SchemaEntity
  # Module that represents the main level of a schema tag
  module SchemaBase
    extend ActiveSupport::Concern
    include ActiveModel::Validations
    included do
      schema_attr :failures, failures: {}
    end
  end
end
