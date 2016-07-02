class Folder < ActiveRecord::Base
  HTYPE = 7
    
  belongs_to :infohash
end
