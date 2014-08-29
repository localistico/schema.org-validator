# Encoding: utf-8
# Module that represents any kind of Entity
module SchemaEntity
  extend ActiveSupport::Concern
  include ActiveModel::Validations
  included do
    attr_accessor :failures
    validates :failures, absence: true
  end
  # Initialize the class with its properties
  def initialize(properties = {})
    properties.each do |key, value|
      begin
        send(:"#{key}=", value)
      rescue NoMethodError
        # Property doesn't exist
        @failures ||= []
        @failures << key
      end
    end
  end
end
