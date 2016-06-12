class Infohash < ActiveRecord::Base
  belongs_to :visibility
  belongs_to :user
  belongs_to :group
  
  has_many :members
  
  validates_presence_of :htype
  
  has_one :publication  # one or zero: creates Publication.infohash_id
  has_one :gfile        # one or zero: creates Gfile.infohash_id
  has_one :pkeyword     # one or zero: creates Pkeyword.infohash_id
  has_one :tag          # one or zero: creates Tag.infohash_id
  has_one :project      # one or zero: creates Project.infohash_id
  has_one :post         # one or zero: creates Post.infohash_id
  
  validates_presence_of :visibility
  validates_presence_of :user
  validates_presence_of :group
end
