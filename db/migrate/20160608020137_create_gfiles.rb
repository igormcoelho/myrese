class CreateGfiles < ActiveRecord::Migration
  def change
    create_table :gfiles do |t|
      t.string :name
      t.text :description
      t.integer :size
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
