class CreateInfohashes < ActiveRecord::Migration
  def change
    create_table :infohashes do |t|
      t.string :code        # resource name, if empty it is 'htype.name + id', ex: pub1, file1005, ..
      t.string :gtitle       # general title
      t.text   :gdescription # general description
      
      t.references :visibility, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      ##t.references :group, index: true, foreign_key: true   #removed
      
      t.references :htype, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
