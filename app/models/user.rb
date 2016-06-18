class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #has_many :groupmembers
  #has_many :groups      , through: :groupmembers
  has_many :owner_groups, dependent: :destroy, source: :groups
  has_many :groups, through: :group_users
  #has_and_belongs_to_many :groups, dependent: :destroy      #deprecated HABTM
  
  #has_and_belongs_to_many :infohashes, dependent: :destroy  #deprecated HABTM
  has_many :owner_infohashes , dependent: :destroy , source: :infohash
  has_many :infohashes, through: :infohash_users
  
  has_many :owner_tags       , dependent: :destroy, source: :tag
end
