# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Thing
  module Thing
    extend ActiveSupport::Concern
    include SchemaBase
    include ActiveModel::Validations
    included do
      schema_attr :additional_type,
                  type: { with_type: URL, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :alternate_name, :description, :name, :same_as, :url,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :image,
                  type: { with_type: [URL, ImageObject], allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :potential_action,
                  type: { with_type: Action, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
