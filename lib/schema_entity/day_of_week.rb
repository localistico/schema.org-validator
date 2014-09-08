# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity DayOfWeek
  module DayOfWeek
    extend ActiveSupport::Concern
    include Thing
    include ActiveModel::Validations
    attr_accessor :value
    included do
      validates :value, presence: true
    end
  end
end
