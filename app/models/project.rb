class Project < ActiveRecord::Base
  has_one :infohash
  validates_presence_of :infohash
  validates_presence_of :name
  validates_presence_of :description
end
