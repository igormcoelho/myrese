class Project < ActiveRecord::Base
  belongs_to :infohash
  
  validates_presence_of :infohash    #infohash_id
  
  validates_presence_of :name
  validates_presence_of :description
  
  has_many :project_profiles
  has_many :members, through: :project_profiles, source: :profile
end
