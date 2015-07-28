class TagRecord < ActiveRecord::Base
  belongs_to :franken_beer
  belongs_to :tag
end