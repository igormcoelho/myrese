class CreateInfohashMembers < ActiveRecord::Migration
  def change
    create_table :infohash_members do |t|
      t.references :infohash, index: true, foreign_key: true
      t.string :member
      t.references :identification, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
