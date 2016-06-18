class Publication < ActiveRecord::Base
  belongs_to :infohash  , dependent: :destroy
  #belongs_to :user         , through: :infohash
  delegate :user         , to: :infohash # belongs_to through (doesn't exist!)
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  delegate :group        , to: :infohash
  delegate :group_id     , to: :infohash
  
  belongs_to :pubtype
  #has_many :pauthors
  #has_many :pkeywords
  
  validates_presence_of :infohash
  validates_presence_of :pubtype
  validates_presence_of :title
  validates_presence_of :year
  validates_presence_of :authors
  validates_presence_of :keywords
end
