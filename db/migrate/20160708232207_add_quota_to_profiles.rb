class AddQuotaToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :quota, :integer
  end
end
