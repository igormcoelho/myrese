class Group < ActiveRecord::Base
    has_many :infohashes
    has_many :groupmembers
    has_many :users, through: :groupmembers
    
    validates_presence_of :name
end
