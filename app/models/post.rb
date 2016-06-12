class Post < ActiveRecord::Base
  belongs_to :infohash
  
  validates_presence_of :infohash    #infohash_id
  
  validates_presence_of :subject
  validates_presence_of :message
end
