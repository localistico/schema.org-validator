# Encoding: utf-8
require 'failures_validator.rb'

# Module that represents any kind of Entity
module SchemaEntity
  extend ActiveSupport::Concern
  include ActiveModel::Validations
  included do
    attr_accessor :failures
    validates_failures_of :failures
  end
  # Initialize the class with its properties
  def initialize(properties = {})
    properties.each do |key, value|
      begin
        send(:"#{key}=", value)
      rescue NoMethodError
        # Property doesn't exist
        @failures ||= {}
        @failures[key] = "property doesn't exist"
      end
    end
  end
end
