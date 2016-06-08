class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :infohash, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
