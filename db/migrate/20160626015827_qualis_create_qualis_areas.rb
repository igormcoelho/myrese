class QualisCreateQualisAreas < ActiveRecord::Migration
  def change
    create_table :qualis_areas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
