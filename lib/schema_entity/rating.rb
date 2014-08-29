# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Rating
  module Rating
    extend ActiveSupport::Concern
    include Thing
    include Intangible
    include ActiveModel::Validations
    included do
      attr_accessor :best_rating, :rating_value, :worst_rating
      validates_presence_of :rating_value
      validates_type_of :best_rating, :worst_rating,
                        with_type: [Text, Number], allow_nil: true
      validates_type_of :rating_value,
                        with_type: Text, allow_nil: true
    end
  end
end
