json.array!(@franken_ratings) do |franken_rating|
  json.extract! franken_rating, :id, :score, :comment, :serving, :user_id, :franken_beer_id, :franken_brewery_id
  json.url franken_rating_url(franken_rating, format: :json)
end
