class CreateInforelations < ActiveRecord::Migration
  def change
    create_table :inforelations do |t|
      t.integer :infohash1
      t.integer :infohash2

      t.timestamps null: false
    end
  end
end
