class CreateGroupInfohashes < ActiveRecord::Migration
  def change
    create_table :group_infohashes do |t|
      t.references :group, index: true, foreign_key: true
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
