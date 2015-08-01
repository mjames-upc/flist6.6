# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
path = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
load path if File.exist?(path)

connection = ActiveRecord::Base.connection()

sql = <<-EOL
  update franken_ratings set franken_beer_id = (select id from franken_beers where rbid = franken_ratings.rbid);
  update franken_beers set franken_brewery_id = (select id from franken_breweries where rbid = franken_beers.rbbrewer);
  update franken_ratings set franken_brewery_id = (select id from franken_breweries where rbid = franken_ratings.rbbrewer);
EOL

sql.split(';').each do |s|
  connection.execute(s.strip) unless s.strip.empty?
end
