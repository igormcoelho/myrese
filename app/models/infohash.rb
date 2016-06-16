class Infohash < ActiveRecord::Base
  belongs_to :visibility
  belongs_to :user      
  belongs_to :group     
  
  belongs_to :htype     
  
  has_many :members , dependent: :destroy
  has_many :tags    , dependent: :destroy
  
  validates_presence_of :gtitle       # general title 
  validates_presence_of :gdescription # general description
  
  validates_presence_of :htype_id
  
  has_one :publication  , dependent: :destroy # one or zero: creates Publication.infohash_id
  has_one :gfile        , dependent: :destroy # one or zero: creates Gfile.infohash_id
  has_one :project      , dependent: :destroy # one or zero: creates Project.infohash_id
  has_one :post         , dependent: :destroy # one or zero: creates Post.infohash_id
  has_one :reminder     , dependent: :destroy # one or zero: creates Reminder.infohash_id
  
  validates_presence_of :visibility
  validates_presence_of :user
  validates_presence_of :group
end
