class Publication < ActiveRecord::Base
  belongs_to :infohash   #, dependent: :destroy
  ##after_destroy :destroy_infohash
  
  delegate :user         , to: :infohash # belongs_to through (doesn't exist!)
  delegate :members      , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  
  has_many :publication_profiles
  has_many :authors, through: :publication_profiles, source: :profile
  
  #attr_reader(:mainauthor)
  #validates_presence_of :mainauthor, message: "At least one author must be provided"
  #def mainauthor
  #  self.authors.first
  #end
  
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

end
