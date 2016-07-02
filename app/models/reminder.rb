class Reminder < ActiveRecord::Base
  HTYPE = 5
  
  belongs_to :infohash
  
  delegate :user, to: :infohash
  
  validates_presence_of :dtime
end
