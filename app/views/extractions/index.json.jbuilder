json.array!(@extractions) do |extraction|
  json.extract! extraction, :id, :url
  json.url extraction_url(extraction, format: :json)
end
