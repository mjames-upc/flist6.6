class FrankenBeer < ActiveRecord::Base
  belongs_to :franken_brewery
  has_many :franken_ratings
  has_many :tag_records
end
