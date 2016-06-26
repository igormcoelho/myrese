class QualisCreateQualisClassifications < ActiveRecord::Migration
  def change
    create_table :qualis_classifications do |t|
      t.string :classification
      t.references :qualis_area, index: true, foreign_key: true
      t.references :qualis_journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
