class FrankenBeer < ActiveRecord::Base
  before_create :create_slug

  belongs_to :franken_brewery
  has_many :franken_ratings
  has_many :tag_records
  acts_as_votable 

  extend FriendlyId
    friendly_id :beername, use: :slugged

  def to_param
    slug
  end

  def create_slug
    self.slug = self.beername.parameterize
  end

  def should_generate_new_friendly_id?
    slug.blank? || beername_changed?
  end
 
  def self.search(search)
    if search
      where('lower(beername) LIKE ?', "%#{search.downcase}%")
    else 
      all
    end
  end
end
