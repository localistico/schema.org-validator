# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity AggregateRating
  module AggregateRating
    extend ActiveSupport::Concern
    include Rating
    include Thing
    include ActiveModel::Validations
    included do
      attr_accessor :item_reviewed, :rating_count, :review_count
      validates_presence_of :item_reviewed, :rating_count, :review_count
      validates_type_of :item_reviewed, with_type: Thing, allow_nil: true
      validates_type_of :rating_count, :review_count,
                        with_type: Number, allow_nil: true
    end
  end
end
