class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :infohash, index: true, foreign_key: true
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
