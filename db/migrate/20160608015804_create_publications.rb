class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :pubtype, index: true, foreign_key: true
      t.string :title
      t.string :journal
      t.integer :year
      t.string :doi
      t.string :keywords    # all keywords together
      t.text :other
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
