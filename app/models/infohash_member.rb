class InfohashMember < ActiveRecord::Base
  belongs_to :infohash
  belongs_to :identification
  
  validates_presence_of :infohash
  validates_presence_of :identification
  validates_presence_of :member
end
