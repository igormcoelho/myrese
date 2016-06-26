class CreateWeblinks < ActiveRecord::Migration
  def change
    create_table :weblinks do |t|
      t.references :infohash, index: true, foreign_key: true
      t.string :link

      t.timestamps null: false
    end
  end
end
