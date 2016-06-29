class CreateSupervisions < ActiveRecord::Migration
  def change
    create_table :supervisions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :suptype
      t.boolean :mainsup
      t.references :profile, index: true, foreign_key: true
      t.date :date_begin
      t.date :date_end

      t.timestamps null: false
    end
  end
end
