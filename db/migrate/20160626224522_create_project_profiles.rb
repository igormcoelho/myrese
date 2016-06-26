class CreateProjectProfiles < ActiveRecord::Migration
  def change
    create_table :project_profiles do |t|
      t.references :project, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.string :role

      t.timestamps null: false
    end
  end
end
