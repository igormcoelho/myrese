class Gfile < ActiveRecord::Base
  belongs_to :infohash    #if this has the other_id field
  #has_one :other         #if the other has this_id field
  validates_presence_of :infohash
  validates_presence_of :name
  validates_presence_of :size
end
