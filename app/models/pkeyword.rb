class Pkeyword < ActiveRecord::Base
  belongs_to :publication
  has_one :infohash
  validates_presence_of :infohash
  validates_presence_of :publication
  validates_presence_of :keyword
end
