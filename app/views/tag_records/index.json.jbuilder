json.array!(@tag_records) do |tag_record|
  json.extract! tag_record, :id, :franken_beer_id, :tag_id
  json.url tag_record_url(tag_record, format: :json)
end
