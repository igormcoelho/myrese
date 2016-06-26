class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :website
      t.string :logo
      t.string :address
      t.string :itype

      t.timestamps null: false
    end
  end
end
