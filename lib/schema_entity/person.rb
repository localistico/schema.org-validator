# Encoding: utf-8
module SchemaEntity
  # Class that represents the entity Person
  module Person
    extend ActiveSupport::Concern
    include ActiveModel::Validations
    included do
    end
  end
end
