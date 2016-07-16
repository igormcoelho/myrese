class Post < ActiveRecord::Base
  HTYPE = 4
  
  belongs_to :infohash  , autosave: true ###, dependent: :destroy #NEVER DESTROY FROM HERE!
  
  validates_presence_of :infohash    #infohash_id
  
  delegate :user        , to: :infohash # belongs_to through (doesn't exist!)
  delegate :members     , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  delegate :code         , to: :infohash
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  
  after_save :create_tags
  
  def create_tags
    ##self.tags.destroy_all ##INFOHASH WILL DESTROY FIRST

    lhash = self.message.scan(/\B#\w+/) #scan(/#\S+/)
    lhash = lhash.uniq     # remove repetitions
        
    # insert only unique
    ActiveRecord::Base.transaction do
      lhash.each do |h|
        Tag.create(:tagname => h, :infohash => self.infohash) # h.downcase
      end
    end
  end
  
  
  validates_presence_of :subject
  validates_presence_of :message
end
