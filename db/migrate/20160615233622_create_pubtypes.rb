class CreatePubtypes < ActiveRecord::Migration
  def change
    create_table :pubtypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
