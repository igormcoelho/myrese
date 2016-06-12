class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :ptype
      t.string :title
      t.string :journal
      t.integer :year
      t.string :doi
      t.text :other
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
