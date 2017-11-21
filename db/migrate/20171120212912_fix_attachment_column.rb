class FixAttachmentColumn < ActiveRecord::Migration
  def change
    rename_column :attachments, :infohash_id, :infohash1_id
    add_column :attachments, :infohash2_id, :integer, :references => "infohashes" 
  end
end
