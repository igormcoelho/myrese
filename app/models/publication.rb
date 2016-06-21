class Publication < ActiveRecord::Base
  belongs_to :infohash  , dependent: :destroy
  #belongs_to :user         , through: :infohash
  delegate :user         , to: :infohash # belongs_to through (doesn't exist!)
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  ##delegate :group        , to: :infohash
  ##delegate :group_id     , to: :infohash
  
  belongs_to :pubtype
  #has_many :pauthors
  #has_many :pkeywords
  
  validates_presence_of :gtitle        , message: "General title is missing"
  validates_presence_of :gdescription  , message: "General description is missing"
  validates_presence_of :visibility    , message: "Visibility is missing"
  
  validates_presence_of :infohash      , message: "Infohash reference is missing"
  validates_presence_of :pubtype       , message: "Publication type is missing"
  validates_presence_of :title         , message: "Publication title is missing"
  validates_presence_of :year          , message: "Publication year is missing"
  validates_presence_of :authors       , message: "Authors list is missing"

end
