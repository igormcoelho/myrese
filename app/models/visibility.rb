class Visibility < ActiveRecord::Base
    ##self.inheritance_column = nil # fix for field 'type', which should be reserved... now it is 'vtype', no problem!
    validates_presence_of :vtype
    
    VCODES = { vprivate: 1, vinstance: 2, vpublic: 3 } # TODO: REMOVE vtype field and htypes table!
    
    has_many :infohashes
end
