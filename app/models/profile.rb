class Profile < ActiveRecord::Base
  belongs_to :user        #, optional: true
  belongs_to :visibility
  
  has_many :publications, through: :publication_profiles
  
  #validates_presence_of :citation
  validates :citation, presence: true, uniqueness: true
  validates_presence_of :visibility
  validates_presence_of :quota
  
  def quota_usage
    if self.user
      myfiles = Gfile.joins(:infohash).where("infohashes.user_id = ?", self.user.id)
      sumf = 0.0000000
      myfiles.each do |f|
        sumf += f.filename_file_size
      end
      return sumf / (1024.0*1024.0) # megabytes
    else
      return 0.0000000
    end
  end
  
  ##validates :user, presence: true, uniqueness: true
end
