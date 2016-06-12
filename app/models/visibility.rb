class Visibility < ActiveRecord::Base
    ##self.inheritance_column = nil # fix for field 'type', which should be reserved... now it is 'vtype', no problem!
    validates_presence_of :vtype
    
    has_many :infohashes
end
