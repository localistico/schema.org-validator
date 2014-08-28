# Encoding: utf-8
module SchemaEntity
  # Class that represents the entity AdministrativeArea
  module AdministrativeArea
    extend ActiveSupport::Concern
    include Place
    include Thing
    include ActiveModel::Validations
    included do
    end
  end
end
