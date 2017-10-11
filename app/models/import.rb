class Import < ActiveRecord::Base
  belongs_to :user
  belongs_to :infohash
end
