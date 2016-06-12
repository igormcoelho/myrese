class Publication < ActiveRecord::Base
  belongs_to :infohash
  has_one :user, through: :infohash
  
  has_many :pauthors
  has_many :pkeywords
  
  validates_presence_of :infohash
  validates_presence_of :title
  validates_presence_of :year
  validates_presence_of :ptype
end
