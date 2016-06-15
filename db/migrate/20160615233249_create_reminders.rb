class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.datetime :dtime
      t.references :infohash, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
