class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :citation  
      t.text :shortbio
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
