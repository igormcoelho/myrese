class Infohash < ActiveRecord::Base
  belongs_to :visibility
  belongs_to :user
  belongs_to :group
  
  validates_presence_of :visibility
  validates_presence_of :user
  validates_presence_of :group
  
  validates_presence_of :htype
end
