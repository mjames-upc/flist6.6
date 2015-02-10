class FrankenBrewery < ActiveRecord::Base
  has_many :franken_beers
  has_many :franken_ratings
end
