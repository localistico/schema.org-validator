# Encoding: utf-8
require 'type_validator.rb'
require 'nested_validator.rb'

module SchemaEntity
  # Module that represents the entity Review
  module Review
    extend ActiveSupport::Concern
    include CreativeWork
    include ActiveModel::Validations
    included do
      attr_accessor :item_reviewed, :review_body, :review_rating
      validates_presence_of :item_reviewed, :review_body, :review_rating
      validates_type_of :item_reviewed, with_type: Thing, allow_nil: true
      validates_type_of :review_body, with_type: Text, allow_nil: true
      validates_type_of :review_rating, with_type: Rating, allow_nil: true
      validates_nested :item_reviewed, :review_body, :review_rating,
                       allow_nil: true
    end
  end
end
