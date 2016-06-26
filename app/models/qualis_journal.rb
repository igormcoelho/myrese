class QualisJournal < ActiveRecord::Base
    validates_presence_of   :journal
    validates_uniqueness_of :journal
    validates_presence_of   :issn
    validates_uniqueness_of :issn
end
