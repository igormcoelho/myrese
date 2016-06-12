class Group < ActiveRecord::Base
    has_many :infohashes
    
    validates_presence_of :name
end
