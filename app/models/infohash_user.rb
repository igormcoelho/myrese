class InfohashUser < ActiveRecord::Base
  belongs_to :infohash
  belongs_to :user
end
