class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text   :abstract
      t.string :keywords    # all keywords together
      
      t.references :profile, index: true, foreign_key: true
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
