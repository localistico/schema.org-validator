module SchemaEntity
  # Class that represents the entity Thing
  module Thing
    extend ActiveSupport::Concern
    include SchemaEntity
    include ActiveModel::Validations
    
    included do
      
    end
  end
end