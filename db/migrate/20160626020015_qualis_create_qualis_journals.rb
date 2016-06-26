class QualisCreateQualisJournals < ActiveRecord::Migration
  def change
    create_table :qualis_journals do |t|
      t.string :journal
      t.string :issn

      t.timestamps null: false
    end
  end
end
