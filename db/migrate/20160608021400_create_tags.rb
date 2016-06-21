class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user, index:true, foreign_key: true       # owner
      t.string :tagname , unique: true                        # information
      t.references :infohash, index: true, foreign_key: true  # resource

      t.timestamps null: false
    end
  end
end
