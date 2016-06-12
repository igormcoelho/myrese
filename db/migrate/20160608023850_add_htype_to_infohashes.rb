class AddHtypeToInfohashes < ActiveRecord::Migration
  def change
    add_column :infohashes, :htype, :integer
  end
end
