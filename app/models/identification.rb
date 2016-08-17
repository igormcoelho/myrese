class Identification < ActiveRecord::Base
    validates_presence_of :title
    validates_presence_of :service
    validates_presence_of :location
    
    validates_uniqueness_of :service
end
