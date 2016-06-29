class QualisEvaluateJournal < ActiveRecord::Base
  belongs_to :profile
  belongs_to :evaluation
  
  validates_presence_of :profile
  validates_presence_of :evaluation
  validates_presence_of :target_qualis
  validates_presence_of :year_begin
  validates_presence_of :year_end
end
