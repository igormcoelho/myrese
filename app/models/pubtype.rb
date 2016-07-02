class Pubtype < ActiveRecord::Base
    has_many :publications
    
    validates_presence_of   :name
    validates_uniqueness_of :name
end
