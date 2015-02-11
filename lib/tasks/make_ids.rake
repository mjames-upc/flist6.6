# franken_beer.franken_brewery_id should be set to franken_brewery.id where franken_beer.rbbrewer = franken_brewery.rbid
namespace :db do
  desc "set brewery ids"
  task make_ids: :environment do
    FrankenBeer.all.each do |beer|
      franken_brewery = FrankenBrewery.find_or_create_by(rbid: beer.rbbrewer) # http://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-find_or_create_by
      beer.franken_brewery_id = franken_brewery.id
      beer.save!
    end
    FrankenRating.all.each do |rating|
      franken_brewery = FrankenBrewery.find_or_create_by(rbid: rating.rbbrewer) # http://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-find_or_create_by
      franken_beer = FrankenBeer.find_or_create_by(rbid: rating.rbid) # http://api.rubyonrails.org/classes/ActiveRecord/Relation.html#method-i-find_or_create_by
      rating.franken_brewery_id = franken_brewery.id
      rating.franken_beer_id = franken_beer.id
      rating.save!
    end
  end
end
