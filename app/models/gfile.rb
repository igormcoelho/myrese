class Gfile < ActiveRecord::Base
  belongs_to :infohash
  
  delegate :user         , to: :infohash
  delegate :members      , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  
  validates_associated  :infohash      , message: "Failed to validate general information"

  #validates_presence_of :name
  #validates_presence_of :size
  
  has_attached_file :filename #, styles: { medium: "600x400>", thumb: "150x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :filename, content_type: /\Aimage\/.*\Z/
  #validates_attachment_content_type :filename, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf', 'application/zip']
  #validates :filename, attachment_presence: true, validate_media_type: false
  
  do_not_validate_attachment_file_type :filename
  # ALSO DISABLED SPOOF CHECK IN config/initializers/paperclip.rb
  # STILL NEEDING A WORKAROUND FOR FIREFOX AND PDF FILES :(
  
  #validates_attachment_content_type :filename, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/force-download", "application/xls", "application/xlsx", "application/doc", "application/docx", "application/ppt", "application/pptx"]
  
  validates_with AttachmentSizeValidator, attributes: :filename, less_than: 20.megabytes
  
end
