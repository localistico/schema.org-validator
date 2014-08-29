# Encoding: utf-8
require 'type_validator.rb'

module SchemaEntity
  # Module that represents the entity URL
  module URL
    extend ActiveSupport::Concern
    include Text
    include ActiveModel::Validations
    included do
      validates_format_of :value, with: URI.regexp(['http'])
    end
  end
end
