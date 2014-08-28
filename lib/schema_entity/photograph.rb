# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Photograph
  module Photograph
    extend ActiveSupport::Concern
    include CreativeWork
    include Thing
    include ActiveModel::Validations
    included do
    end
  end
end
