class FrankenRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :franken_beer
  belongs_to :franken_brewery
  acts_as_votable 
end
