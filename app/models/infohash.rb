class Infohash < ActiveRecord::Base
  belongs_to :visibility
  belongs_to :user          #owner

  #has_and_belongs_to_many :groups   # deprecated
  has_many :group_infohashes  , dependent: :delete_all
  has_many :groups            , through: :group_infohashes   #HMT is more flexible!
  
  belongs_to :htype     
  
  has_many :infohash_users    , dependent: :delete_all
  has_many :members           , through: :infohash_users, source: :user
  has_many :tags              , dependent: :delete_all
  
  after_update :recreate_tags
  after_create :create_tags
  
  def recreate_tags
    tags.destroy
    create_tags
  end
  
  def create_tags
    lhash = self.gdescription.scan(/\B#\w+/) #scan(/#\S+/)
    lhash = lhash.uniq     # remove repetitions
        
    # insert only unique
    ActiveRecord::Base.transaction do
      lhash.each do |h|
        Tag.create(:tagname => h.downcase, :infohash => self)
      end
    end
  end
  
  validates_presence_of :gtitle       , message: "General Title is missing"
  validates_presence_of :gdescription , message: "General Description is missing"
  
  validates_presence_of :htype_id
  
  has_one :publication  , dependent: :destroy # one or zero: creates Publication.infohash_id
  has_one :gfile        , dependent: :destroy # one or zero: creates Gfile.infohash_id
  has_one :project      , dependent: :destroy # one or zero: creates Project.infohash_id
  has_one :post         , dependent: :destroy # one or zero: creates Post.infohash_id
  has_one :reminder     , dependent: :destroy # one or zero: creates Reminder.infohash_id
  has_one :weblink      , dependent: :destroy # one or zero: creates Weblink.infohash_id
  
  validates_presence_of :visibility
  validates_presence_of :user
  ###validates_presence_of :group_id
end
