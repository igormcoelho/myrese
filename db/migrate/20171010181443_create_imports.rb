class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.references :user, index: true, foreign_key: true
      t.string :url
      t.text :jsondata

      t.timestamps null: false
    end
  end
end
