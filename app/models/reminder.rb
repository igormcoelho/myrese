class Reminder < ActiveRecord::Base
  belongs_to :infohash
  
  delegate :user, to: :infohash
  
  validates_presence_of :dtime
end
