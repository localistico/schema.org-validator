module SchemaEntity
  # Module that represents the entity Organization
  module Organization
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    
    included do
      
    end
  end
end