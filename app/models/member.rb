class Member < ActiveRecord::Base
  belongs_to :infohash
  belongs_to :user
end
