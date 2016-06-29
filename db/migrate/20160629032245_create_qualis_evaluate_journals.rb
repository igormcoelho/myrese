class CreateQualisEvaluateJournals < ActiveRecord::Migration
  def change
    create_table :qualis_evaluate_journals do |t|
      t.references :profile, index: true, foreign_key: true
      t.integer :year_begin
      t.integer :year_end
      t.references :evaluation, index: true, foreign_key: true
      t.string :target_qualis

      t.timestamps null: false
    end
  end
end
