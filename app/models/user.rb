class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :groupmembers
  has_many :groups      , through: :groupmembers
  
  has_many :infohashes  , dependent: :destroy
  has_many :tags        , dependent: :destroy
end
