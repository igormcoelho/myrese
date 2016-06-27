class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :visibility
  
  has_many :publications, through: :publication_profiles
  
  validates_presence_of :citation
  validates_presence_of :visibility
  
  validates :user, presence: true, uniqueness: true
end
