class AddOrdervToPublicationProfiles < ActiveRecord::Migration
  def change
    add_column :publication_profiles, :orderv, :float
  end
end
