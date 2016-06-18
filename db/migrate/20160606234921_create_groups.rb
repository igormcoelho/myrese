class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :title
      t.text :description
      t.references :user      #owner

      t.timestamps null: false
    end
  end
end
