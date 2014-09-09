# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Restaurant
  module Restaurant
    extend ActiveSupport::Concern
    include FoodEstablishment
    include ActiveModel::Validations
    included do
    end
  end
end
