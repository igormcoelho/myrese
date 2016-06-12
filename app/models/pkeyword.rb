class Pkeyword < ActiveRecord::Base
  belongs_to :publication
  belongs_to :infohash
  
  validates_presence_of :infohash    #infohash_id
  validates_presence_of :publication #publication_id
  
  validates_presence_of :keyword
end
