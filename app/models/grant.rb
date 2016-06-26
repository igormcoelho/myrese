class Grant < ActiveRecord::Base
  belongs_to :project
  belongs_to :profile
  
  validates_presence_of :begin_date
  validates_presence_of :end_date
  
  validates_presence_of :name
  validates_presence_of :funding_agency
  
  validates_presence_of :project, unless: :profile
  validates_presence_of :profile, unless: :project
end
