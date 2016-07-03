class Post < ActiveRecord::Base
  HTYPE = 4
  
  belongs_to :infohash  , autosave: true ###, dependent: :destroy #NEVER DESTROY FROM HERE!
  
  delegate :user        , to: :infohash # belongs_to through (doesn't exist!)
  delegate :members     , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  
  validates_presence_of :infohash    #infohash_id
  
  validates_presence_of :subject
  validates_presence_of :message
end
