class CreateHtypes < ActiveRecord::Migration
  def change
    create_table :htypes do |t|
      t.string :name

      t.timestamps null: false
    end
    
    Htype.create :name => "Publication"
    Htype.create :name => "Gfile"
    Htype.create :name => "Pkeyword"
    Htype.create :name => "Tag"
    Htype.create :name => "Project"
  end
end
