json.array!(@franken_breweries) do |franken_brewery|
  json.extract! franken_brewery, :id, :brewer_name, :address, :city, :district, :rbid, :active, :founded, :brewer_type, :score, :lat, :lon, :web, :hours, :description, :phone
  json.url franken_brewery_url(franken_brewery, format: :json)
end
