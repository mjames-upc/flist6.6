class CreateTagRecords < ActiveRecord::Migration
  def change
    create_table :tag_records do |t|
      t.references :franken_beer, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
