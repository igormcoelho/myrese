class CreateInfohashes < ActiveRecord::Migration
  def change
    create_table :infohashes do |t|
      t.string :code
      t.references :visibility, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      
      t.references :htype, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
