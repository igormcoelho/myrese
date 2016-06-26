class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :position, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
