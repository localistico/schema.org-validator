# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Review
  module Review
    extend ActiveSupport::Concern
    include CreativeWork
    include ActiveModel::Validations
    included do
    end
  end
end
