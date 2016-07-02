class Weblink < ActiveRecord::Base
  HTYPE = 6
  
  belongs_to :infohash
  
  delegate :user, to: :infohash
  
  validates_presence_of :link
end
