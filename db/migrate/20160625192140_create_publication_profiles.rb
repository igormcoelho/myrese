class CreatePublicationProfiles < ActiveRecord::Migration
  def change
    create_table :publication_profiles do |t|
      t.references :publication, index: true, foreign_key: true
      t.string :author
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
