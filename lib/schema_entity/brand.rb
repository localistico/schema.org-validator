# Encoding: utf-8
require 'type_validator.rb'

module SchemaEntity
  # Class that represents the entity Brand
  module Brand
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :logo
      validates_type_of :logo, with_type: [URL, ImageObject], allow_nil: true
    end
  end
end
