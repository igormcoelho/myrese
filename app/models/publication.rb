class Publication < ActiveRecord::Base
  belongs_to :infohash
  has_one :user, through: :infohash
  
  validates_presence_of :infohash_id
  validates_presence_of :title
  validates_presence_of :year
  validates_presence_of :ptype
end
