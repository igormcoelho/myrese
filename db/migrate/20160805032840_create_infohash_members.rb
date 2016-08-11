class CreateInfohashMembers < ActiveRecord::Migration
  def change
    create_table :infohash_members do |t|
      t.references :infohash, index: true, foreign_key: true
      t.string :author
      t.string :identification

      t.timestamps null: false
    end
  end
end
