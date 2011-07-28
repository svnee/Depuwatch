class SplitDeputyNames < ActiveRecord::Migration
  def self.up
    add_column :deputies, :lastname,  :string
    add_column :deputies, :firstname, :string
    
    Deputy.all.each { |d|
      name_parts = d.name.split(" ")
      d.firstname = name_parts[0]
      d.lastname = name_parts[1]
      
      d.save!
    }
  end

  def self.down
    remove_column :deputies, :lastname
    remove_column :deputies, :firstname
  end
end
