class CreateIdentifications < ActiveRecord::Migration
  def change
    create_table :identifications do |t|
      t.string :title
      t.string :service
      t.string :location

      t.timestamps null: false
    end
  end
end
