class Htype < ActiveRecord::Base
    has_many :infohashes #, dependent: :destroy  # DANGEROUS CASCADE DELETE... REMOVE FOR NOW!
    #infohash types: (1) Publication; (2) Gfile ...
    validates_presence_of   :name
    validates_uniqueness_of :name
end
