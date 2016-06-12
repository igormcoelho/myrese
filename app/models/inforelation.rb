class Inforelation < ActiveRecord::Base
    belongs_to :infohash1, :class_name => 'Infohash'
    belongs_to :infohash2, :class_name => 'Infohash'
end
