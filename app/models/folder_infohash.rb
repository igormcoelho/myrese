class FolderInfohash < ActiveRecord::Base
  belongs_to :folder
  belongs_to :infohash
  
  validates_presence_of :folder
  validates_presence_of :infohash
  
  validates_uniqueness_of :folder_id, :scope => :infohash_id
end
