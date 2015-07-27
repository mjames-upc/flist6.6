class FrankenBrewery < ActiveRecord::Base
  before_create :create_slug
  has_many :franken_beers
  has_many :franken_ratings

  extend FriendlyId
    friendly_id :brewer_name, use: :slugged

  def to_param
    slug
  end

  def create_slug
    self.slug = self.brewer_name.parameterize
    self.city_slug = self.city.parameterize
    self.dist_slug = self.district.parameterize
  end

end
