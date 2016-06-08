class CreatePauthors < ActiveRecord::Migration
  def change
    create_table :pauthors do |t|
      t.references :publication, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
