# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Datetime
  module DateTime
    extend ActiveSupport::Concern
    include ActiveModel::Validations
    included do
    end
  end
end
