class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :infohash
  
  delegate :members         , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  validates_presence_of   :infohash
  validates_presence_of   :infohash_id
  validates_presence_of   :tagname
  validates_uniqueness_of :tagname, :scope => :infohash_id
end
