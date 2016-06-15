class Reminder < ActiveRecord::Base
  belongs_to :infohash
  
  has_one :user, through: :infohash
  
  validates_presence_of :dtime
end
