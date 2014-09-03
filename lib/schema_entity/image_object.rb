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
      attr_accessor :caption, :exif_data,
                    :representative_of_page, :thumbnail
      validates_type_of :caption, :exif_data,
                        with_type: Text, allow_nil: true
      validates_type_of :representative_of_page,
                        with_type: Boolean, allow_nil: true
      validates_type_of :thumbnail,
                        with_type: ImageObject, allow_nil: true
      validates_nested :caption, :exif_data,
                       :representative_of_page, :thumbnail,
                       allow_nil: true
    end
  end
end
