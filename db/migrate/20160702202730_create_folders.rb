class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :filter_pattern
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
