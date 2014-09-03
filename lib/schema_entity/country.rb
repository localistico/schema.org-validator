# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Country
  module Country
    extend ActiveSupport::Concern
    include AdministrativeArea
    include ActiveModel::Validations
    included do
    end
  end
end
