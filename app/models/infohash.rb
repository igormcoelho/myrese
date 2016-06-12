class Infohash < ActiveRecord::Base
  belongs_to :visibility
  belongs_to :user
  belongs_to :group
  
  has_many :members
  
  validates_presence_of :htype
  
  has_one :publication  # one or zero: creates publication.infohash_id
  has_one :gfile        # one or zero: creates gfile.infohash_id
  has_one :pkeyword     # one or zero: creates pkeyword.infohash_id
  has_one :tag          # one or zero: creates tag.infohash_id
  has_one :project      # one or zero: creates project.infohash_id
  
  validates_presence_of :visibility
  validates_presence_of :user
  validates_presence_of :group
end
