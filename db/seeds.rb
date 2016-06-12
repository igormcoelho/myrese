# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Visibility.create :vtype => "private"
Visibility.create :vtype => "members"
Visibility.create :vtype => "group"
Visibility.create :vtype => "instance"
Visibility.create :vtype => "public"

Htype.create :name => "Publication"
Htype.create :name => "Gfile"
Htype.create :name => "Pkeyword"
Htype.create :name => "Tag"
Htype.create :name => "Project"

