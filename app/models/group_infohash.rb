class GroupInfohash < ActiveRecord::Base
  belongs_to :group
  belongs_to :infohash
  
  validates_uniqueness_of :group_id, :scope => :infohash_id
end
