class Infohash < ActiveRecord::Base
  belongs_to :visibility
  belongs_to :user
  belongs_to :group
end
