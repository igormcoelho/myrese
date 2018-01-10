class Attachment < ActiveRecord::Base
    belongs_to :infohash #:infohash1, :class_name => 'Infohash'
    # I had to keep this as 'infohash' (not 'infohash1') because of issues with Infohash.has_many attachments
    belongs_to :infohash2, :class_name => 'Infohash'
    
    validates_presence_of :infohash
    validates_presence_of :infohash
    validates_presence_of :infohash2
end
