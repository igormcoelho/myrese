class Supervision < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile
  
  validates_presence_of :user
  validates_presence_of :suptype
  validates_presence_of :date_begin
  validates_presence_of :title

end
