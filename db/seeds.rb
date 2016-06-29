# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##Visibility.create :vtype => "private" 
##Visibility.create :vtype => "group"

Visibility.create :vtype => "private (for members)" , :id => 1 # the first three now are 'members' (private, group, and members)
Visibility.create :vtype => "instance"              , :id => 2
Visibility.create :vtype => "public"                , :id => 3

##Htype.create :name => "Pkeyword"
##Htype.create :name => "Tag"
Htype.create :name => "Publication", :shortname => "pub"   , :id => 1
Htype.create :name => "File"       , :shortname => "file"  , :id => 2
Htype.create :name => "Project"    , :shortname => "proj"  , :id => 3
Htype.create :name => "Post"       , :shortname => "post"  , :id => 4
Htype.create :name => "Reminder"   , :shortname => "rem"   , :id => 5
Htype.create :name => "Weblink"    , :shortname => "link"  , :id => 6


Pubtype.create :name => "article"        , :id => 1 
Pubtype.create :name => "book"           , :id => 2
Pubtype.create :name => "proceedings"    , :id => 3
Pubtype.create :name => "chapter"        , :id => 4
Pubtype.create :name => "inproceedings"  , :id => 5
Pubtype.create :name => "techreport"     , :id => 6
Pubtype.create :name => "mastersthesis"  , :id => 7
Pubtype.create :name => "phdthesis"      , :id => 8
Pubtype.create :name => "manual"         , :id => 9
Pubtype.create :name => "online"         , :id => 10
Pubtype.create :name => "misc"           , :id => 11
