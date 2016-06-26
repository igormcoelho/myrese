class QualisClassification < ActiveRecord::Base
  belongs_to :qualis_area
  belongs_to :qualis_journal
  
  validates_presence_of :qualis_journal
  validates_presence_of :qualis_journal_id
  validates_presence_of :qualis_area
  validates_presence_of :qualis_area_id
  validates_presence_of :classification
  
  validates_uniqueness_of :qualis_journal_id, :scope => :qualis_area_id
end
