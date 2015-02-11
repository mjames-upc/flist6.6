class CreateFrankenRatings < ActiveRecord::Migration
  def change
    create_table :franken_ratings do |t|
      t.float :score
      t.text :comment
      t.integer :serving
      t.integer :rbid
      t.integer :rbbrewer
      t.references :user, index: true
      t.references :franken_beer, index: true
      t.references :franken_brewery, index: true

      t.timestamps
    end
  end
end
