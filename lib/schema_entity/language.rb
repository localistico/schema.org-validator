# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Language
  module Language
    extend ActiveSupport::Concern
    include Intangible
    include Thing
    include ActiveModel::Validations
    included do
    end
  end
end
