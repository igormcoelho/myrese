class CreateFolderInfohashes < ActiveRecord::Migration
  def change
    create_table :folder_infohashes do |t|
      t.references :folder, index: true, foreign_key: true
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
