class Position < ActiveRecord::Base
  belongs_to :profile
  belongs_to :institution
end
