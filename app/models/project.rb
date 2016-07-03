class Project < ActiveRecord::Base
  HTYPE = 3
  
  belongs_to :infohash   , autosave: true
  
  delegate :user         , to: :infohash # belongs_to through (doesn't exist!)
  delegate :members      , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  
  has_many :project_profiles
  has_many :members, through: :project_profiles, source: :profile
  
  validates_presence_of :name
  validates_presence_of :abstract
  validates_presence_of :keywords
  
  belongs_to :profile
end
