class Publication < ActiveRecord::Base
  belongs_to :infohash  , dependent: :destroy
  has_one :user         , through: :infohash
  #has_many :gtitle, :through => :infohash, :source => :publication
  #has_one :gdescription , through: :infohash
  
  belongs_to :pubtype
  #has_many :pauthors
  #has_many :pkeywords
  
  validates_presence_of :infohash
  validates_presence_of :pubtype
  
  validates_presence_of :title
  validates_presence_of :year
  validates_presence_of :ptype
  validates_presence_of :authors
  validates_presence_of :keywords
end
