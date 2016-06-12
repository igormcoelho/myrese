class CreateInforelations < ActiveRecord::Migration
  def change
    create_table :inforelations do |t|
      t.references :infohash1
      t.references :infohash2

      t.timestamps null: false
    end
  end
end
