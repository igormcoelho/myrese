class FixAttachmentColumn2 < ActiveRecord::Migration
  def change
    rename_column :attachments, :infohash1_id, :infohash_id
  end
end
