# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity ImageObject
  module ImageObject
    extend ActiveSupport::Concern
    include MediaObject
    include ActiveModel::Validations
    included do
      schema_attr :caption, :exif_data,
                  type: { with_type: Text, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :representative_of_page,
                  type: { with_type: Boolean, allow_nil: true },
                  nested: { allow_nil: true }
      schema_attr :thumbnail,
                  type: { with_type: ImageObject, allow_nil: true },
                  nested: { allow_nil: true }
    end
  end
end
