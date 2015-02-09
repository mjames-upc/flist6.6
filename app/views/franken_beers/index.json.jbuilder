json.array!(@franken_beers) do |franken_beer|
  json.extract! franken_beer, :id, :beername, :active, :rbid, :franken_brewery_id
  json.url franken_beer_url(franken_beer, format: :json)
end
