class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :name
      t.string :number
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :funding_agency
      t.references :project, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
