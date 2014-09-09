# Encoding: utf-8
require 'type_validator.rb'

module SchemaEntity
  # Module that represents the value Number
  module Number
    extend ActiveSupport::Concern
    include DataType
    include ActiveModel::Validations
    included do
      validates_format_of :value, with: /\A^\d+$\Z/i
    end
  end
end
