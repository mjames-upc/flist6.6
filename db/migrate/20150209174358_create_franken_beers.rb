class CreateFrankenBeers < ActiveRecord::Migration
  def change
    create_table :franken_beers do |t|
      t.string :beername
      t.string :slug
      t.boolean :active
      t.integer :rbid
      t.integer :rbbrewer
      t.references :franken_brewery, index: true
      t.float :alcohol
      t.float :score
      t.text :description
      t.timestamps
    end
  end
end
