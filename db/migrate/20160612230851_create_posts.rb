class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :infohash, index: true, foreign_key: true
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
