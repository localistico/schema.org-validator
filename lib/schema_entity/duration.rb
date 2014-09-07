# Encoding: utf-8
module SchemaEntity
  # Module that represents the entity Duration
  module Duration
    extend ActiveSupport::Concern
    include Quantity
    include ActiveModel::Validations
    included do
      attr_accesor :value
      # ISO_8601 Durations regex
      validates_format_of :value,
                          with:
                          /\A(?x)(P(\d+Y)?(\d+M)?(\d+D)?(T(((\d+H)
                          (\d+M)?(\d+(\.\d{1,2})?S)?)|
                          ((\d+M)(\d+(\.\d{1,2})?S)?)|
                          ((\d+(\.\d{1,2})?S))))?)\Z/i
    end
  end
end
