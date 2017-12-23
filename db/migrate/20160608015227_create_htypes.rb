class CreateHtypes < ActiveRecord::Migration
  def change
    create_table :htypes do |t|
      t.string :name       # Publication, Gfile, Project, ...
      t.string :shortname  # pub, file, proj, ...

      t.timestamps null: false
    end
  end
end
