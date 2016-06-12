class CreateVisibilities < ActiveRecord::Migration
  def change
    create_table :visibilities do |t|
      t.string :vtype

      t.timestamps null: false
    end
  end
end
