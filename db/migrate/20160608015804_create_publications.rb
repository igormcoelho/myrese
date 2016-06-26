class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :pubtype, index: true, foreign_key: true
      t.string :title
      t.integer :year
      t.string :ctitle      #collection title {journal name, book title when chapters, conference proceedings}
      t.string :issn
      t.string :isbn
      t.string :editor
      t.string :publisher
      t.string :organization
      t.string :address
      t.string :month
      t.integer :volume
      t.integer :number
      t.string :series
      t.integer :page_begin
      t.integer :page_end
      t.string :howpublished
      t.string :doi
      t.string :keywords    # all keywords together
      t.text :other
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
