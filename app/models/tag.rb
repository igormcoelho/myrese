class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :infohash
  
  validates_presence_of  :infohash
  validates_presence_of  :infohash_id
  validates_presence_of   :tagname
  #validates_uniqueness_of :tagname #for now, allow repetition! #TODO improve efficiency and avoid copies
end
