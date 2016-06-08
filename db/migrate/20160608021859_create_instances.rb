class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :name
      t.string :pubKey
      t.datetime :pubKeyExpiration
      t.string :address
      t.boolean :allowAutomaticPull
      t.boolean :allowPull

      t.timestamps null: false
    end
  end
end
