# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Enumeration
  module Enumeration
    extend ActiveSupport::Concern
    include Intangible
    include ActiveModel::Validations
    included do
    end
  end
end
