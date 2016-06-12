class CreateVisibilities < ActiveRecord::Migration
  def change
    create_table :visibilities do |t|
      t.string :vtype

      t.timestamps null: false
    end
    
    Visibility.create :vtype => "private"
    Visibility.create :vtype => "members"
    Visibility.create :vtype => "group"
    Visibility.create :vtype => "instance"
    Visibility.create :vtype => "public"
  end
end
