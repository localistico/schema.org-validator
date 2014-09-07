# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity CreativeWork
  module CreativeWork
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    included do
    end
  end
end
