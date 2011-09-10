class AddDetaillinkToDeputies < ActiveRecord::Migration
  def self.up
    add_column :deputies, :chdlink, :string
  end

  def self.down
    remove_column :deputies, :chdlink
  end
end
