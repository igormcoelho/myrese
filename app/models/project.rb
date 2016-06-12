class Project < ActiveRecord::Base
  belongs_to :infohash
  
  validates_presence_of :infohash    #infohash_id
  
  validates_presence_of :name
  validates_presence_of :description
end
