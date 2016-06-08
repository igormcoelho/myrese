class Pkeyword < ActiveRecord::Base
  belongs_to :publication
  belongs_to :infohash
end
