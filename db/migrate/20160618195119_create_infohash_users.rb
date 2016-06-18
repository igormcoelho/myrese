class CreateInfohashUsers < ActiveRecord::Migration
  def change
    create_table :infohash_users do |t|
      t.references :infohash, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
