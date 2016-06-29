class Profile < ActiveRecord::Base
  belongs_to :user        #, optional: true
  belongs_to :visibility
  
  has_many :publications, through: :publication_profiles
  
  #validates_presence_of :citation
  validates :citation, presence: true, uniqueness: true
  validates_presence_of :visibility
  
  ##validates :user, presence: true, uniqueness: true
end
