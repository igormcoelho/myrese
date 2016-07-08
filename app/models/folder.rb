class Folder < ActiveRecord::Base
  HTYPE = 7
    
 belongs_to :infohash   , autosave: true
  
  delegate :user         , to: :infohash # belongs_to through (doesn't exist!)
  delegate :members      , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  
  validates_presence_of :filter_pattern
  
  has_many :folder_infohashes
end
