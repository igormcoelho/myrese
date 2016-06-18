class Group < ActiveRecord::Base
    #has_many :infohashes,   dependent: :destroy # (expects belongs_to on the other side... not this case anymore!)
    
    belongs_to :user   #group owner
    
    #has_and_belongs_to_many :infohashes, dependent: :destroy #HABTM
    has_many :group_infohashes, dependent: :destroy 
    has_many :infohashes, through: :group_infohashes          #HMT (through) is more flexible than HABTM
    
    ##has_many :groupmembers #=> replaced by group_users
    has_many :group_users, dependent: :destroy 
    has_many :users, through: :group_users                    #HMT (through) is more flexible than HABTM
    #has_and_belongs_to_many :users, dependent: :destroy      #HABTM
    
    validates_presence_of :name
end
