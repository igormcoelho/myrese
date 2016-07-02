class GroupUser < ActiveRecord::Base
  belongs_to :group   #NEVER DELETE
  belongs_to :user    #NEVER DELETE
  
  validates_uniqueness_of :user_id, :scope => :group_id
end
