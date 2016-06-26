# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##Visibility.create :vtype => "private" 
##Visibility.create :vtype => "group"
Visibility.create :vtype => "members"  # the first three now are 'members' (private, group, and old members)
Visibility.create :vtype => "instance"
Visibility.create :vtype => "public"

Htype.create :name => "Publication", :shortname => "pub"
Htype.create :name => "File"       , :shortname => "file"
#Htype.create :name => "Pkeyword"
#Htype.create :name => "Tag"
Htype.create :name => "Project"    , :shortname => "proj"
Htype.create :name => "Post"       , :shortname => "post"
Htype.create :name => "Reminder"   , :shortname => "rem"


Pubtype.create :name => "article"
Pubtype.create :name => "book"
Pubtype.create :name => "proceedings"
Pubtype.create :name => "chapter"
Pubtype.create :name => "inproceedings"
Pubtype.create :name => "techreport"
Pubtype.create :name => "mastersthesis"
Pubtype.create :name => "phdthesis"
Pubtype.create :name => "manual"
Pubtype.create :name => "online"
Pubtype.create :name => "misc"
