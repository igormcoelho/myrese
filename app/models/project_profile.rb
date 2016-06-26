class ProjectProfile < ActiveRecord::Base
  belongs_to :project
  belongs_to :profile
  
  validates_presence_of :project
  validates_presence_of :profile
  #:role can be empty
  
  validates_uniqueness_of :profile_id, :scope => :project_id
end
