# Encoding: utf-8
module SchemaEntity
  # Class that represents the entity Thing
  module Thing
    extend ActiveSupport::Concern
    include SchemaEntity
    include ActiveModel::Validations
    included do
      attr_accessor :additional_type, :alternate_name, :description,
                    :image, :name, :potential_action, :same_as, :url
      validates_type_of :additional_type, with_type: URL, allow_nil: true
      validates_type_of :alternate_name, :description, :name, :same_as, :url,
                        with_type: Text, allow_nil: true
      validates_type_of :image, with_type: [URL, ImageObject], allow_nil: true
      validates_type_of :potential_action, with_type: Action, allow_nil: true
    end
  end
end
