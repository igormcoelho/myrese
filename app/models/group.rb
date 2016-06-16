class Group < ActiveRecord::Base
    has_many :infohashes
    has_many :groupmembers
    
    validates_presence_of :name
end
