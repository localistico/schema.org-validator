# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Quantity
  module Quantity
    extend ActiveSupport::Concern
    include Intangible
    include ActiveModel::Validations
    included do
    end
  end
end
