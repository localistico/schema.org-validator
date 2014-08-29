# Encoding: utf-8
module SchemaEntity
  # Module that represents any kind of Data
  module DataType
    extend ActiveSupport::Concern
    include SchemaEntity
    include ActiveModel::Validations
    included do
      attr_accessor :value
      validates_presence_of :value
    end
  end
end
