json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :simple
  json.url tag_url(tag, format: :json)
end
