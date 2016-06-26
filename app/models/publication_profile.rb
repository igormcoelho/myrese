class PublicationProfile < ActiveRecord::Base
  belongs_to :publication
  belongs_to :profile
  
  validates_presence_of :publication
  validates_presence_of :author #:profile may be empty
  
  validates_uniqueness_of :profile_id, :scope => :publication_id
end
