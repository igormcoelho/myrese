class AddOtherToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :other, :text
  end
end
