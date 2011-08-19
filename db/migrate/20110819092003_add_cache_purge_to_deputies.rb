class AddCachePurgeToDeputies < ActiveRecord::Migration
  def self.up
    add_column :deputies, :last_purge, :datetime
    Deputy.all.each do |d|
  		d.last_purge = DateTime.now - 2.days
  		d.save!
  	end
  end

  def self.down
    remove_column :deputies, :last_purge
  end
end
