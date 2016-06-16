class Htype < ActiveRecord::Base
    has_many :infohashes
    #infohash types: (1) Publication; (2) Gfile ...
    validates_presence_of   :name
    validates_uniqueness_of :name
end
