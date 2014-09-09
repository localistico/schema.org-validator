# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Brand
  module Brand
    extend ActiveSupport::Concern
    include Intangible
    include ActiveModel::Validations
    included do
      schema_attr :logo,
                  type: { with_type: [URL, ImageObject], allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
