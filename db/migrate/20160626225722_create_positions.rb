class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :profile, index: true, foreign_key: true
      t.references :institution, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
