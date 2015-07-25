# franken_beer.franken_brewery_id should be set to franken_brewery.id where franken_beer.rbbrewer = franken_brewery.rbid
namespace :db do
  desc "set brewery ids"
  task make_ids: :environment do
    FrankenBeer.all.each do |beer|
      if FrankenBrewery.exists?(rbid: beer.rbbrewer)
        franken_brewery = FrankenBrewery.find_by(rbid: beer.rbbrewer)
        beer.franken_brewery_id = franken_brewery.id
        beer.save!
      end
    end
    FrankenRating.all.each do |rating|
      if FrankenBrewery.exists?(rbid: rating.rbbrewer)
        franken_brewery = FrankenBrewery.find_by(rbid: rating.rbbrewer) 
        if FrankenBeer.exists?(rbid: rating.rbid) 
          franken_beer = FrankenBeer.find_by(rbid: rating.rbid) 
          rating.franken_brewery_id = franken_brewery.id
          rating.franken_beer_id = franken_beer.id
          rating.save!
        end
      end
    end
  end
end
