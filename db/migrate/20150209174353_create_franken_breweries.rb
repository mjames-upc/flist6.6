class CreateFrankenBreweries < ActiveRecord::Migration
  def change
    create_table :franken_breweries do |t|
      t.string :brewer_name
      t.string :slug
      t.string :address
      t.string :city
      t.string :city_slug
      t.string :district
      t.integer :rbid
      t.boolean :active
      t.integer :founded
      t.string :brewer_type
      t.float :score
      t.float :lat
      t.float :lon
      t.string :web
      t.string :hours
      t.text :description
      t.string :phone

      t.timestamps
    end
  end
end
