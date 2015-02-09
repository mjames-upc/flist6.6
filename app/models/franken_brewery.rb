class FrankenBrewery < ActiveRecord::Base
  has_many :franken_beers
  has_many :franken_ratings
  validates_formatting_of :web, using: :url
end
