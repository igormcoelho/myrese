class Infohash < ActiveRecord::Base
  belongs_to :visibility
  belongs_to :user
  belongs_to :group
  
  has_many :members
  has_many :tags
  
  validates_presence_of :title
  validates_presence_of :description
  
  validates_presence_of :htype_id
  
  has_one :publication  # one or zero: creates Publication.infohash_id
  has_one :gfile        # one or zero: creates Gfile.infohash_id
  has_one :project      # one or zero: creates Project.infohash_id
  has_one :post         # one or zero: creates Post.infohash_id
  has_one :reminder     # one or zero: creates Reminder.infohash_id
  
  validates_presence_of :visibility
  validates_presence_of :user
  validates_presence_of :group
end
