# Encoding: utf-8
# Module that represents any kind of Entity
module SchemaEntity
  # Initialize the class with its properties
  def initialize(properties = {})
    @failures = []
    properties.each do |key, value|
      begin
        send(:"#{key}=", value)
      rescue NoMethodError
        # Property doesn't exist
        @failures << key
      end
    end
  end
end
