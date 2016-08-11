class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  before_save :ensure_auth_token

  def ensure_auth_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end
         
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-z0-9_\.]*$/, :multiline => true
  


  
=begin
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
  end
=end
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
  
  has_one :profile  # accepts nil # no destroy
  
  #after_create :create_bars
  #def create_bars 
  #  self.profile = Profile.create(:fullname => :username, :citation => :username, :visibility_id => 3, :user => self)
  #end
  
  #has_many :groupmembers
  #has_many :groups      , through: :groupmembers
  has_many :owner_groups, dependent: :destroy, source: :groups
  has_many :groups, through: :group_users
  #has_and_belongs_to_many :groups, dependent: :destroy      #deprecated HABTM
  
  #has_and_belongs_to_many :infohashes, dependent: :destroy  #deprecated HABTM
  has_many :owner_infohashes , dependent: :destroy , source: :infohash
  has_many :infohashes, through: :infohash_users
  
  has_many :owner_tags       , dependent: :destroy, source: :tag
  
  
  private

  def generate_auth_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(auth_token: token).first
    end
  end

end
