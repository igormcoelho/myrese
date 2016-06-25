class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_many :publications, through: :publication_profiles
  
  validates_presence_of :citation
  
  validates :user, presence: true, uniqueness: true
end
