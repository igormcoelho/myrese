class InfohashUser < ActiveRecord::Base
  belongs_to :infohash
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => :infohash_id
end
