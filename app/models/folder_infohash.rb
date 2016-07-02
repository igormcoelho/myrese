class FolderInfohash < ActiveRecord::Base
  belongs_to :folder
  belongs_to :infohash
end
