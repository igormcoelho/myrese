class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user, index: true, foreign_key: true
      t.string :tagname
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
