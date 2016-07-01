class AddAttachmentFilenameToGfiles < ActiveRecord::Migration
  def self.up
    change_table :gfiles do |t|
      t.attachment :filename
    end
  end

  def self.down
    remove_attachment :gfiles, :filename
  end
end
