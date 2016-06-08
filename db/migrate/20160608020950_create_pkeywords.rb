class CreatePkeywords < ActiveRecord::Migration
  def change
    create_table :pkeywords do |t|
      t.references :publication, index: true, foreign_key: true
      t.references :infohash, index: true, foreign_key: true
      t.string :keyword

      t.timestamps null: false
    end
  end
end
