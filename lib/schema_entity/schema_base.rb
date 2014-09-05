module SchemaEntity
  module SchemaBase
    extend ActiveSupport::Concern
    include ActiveModel::Validations
    included do
      schema_attr :failures, failures: {}
    end
  end
end