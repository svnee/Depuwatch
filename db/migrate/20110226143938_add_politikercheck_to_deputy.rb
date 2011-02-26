class AddPolitikercheckToDeputy < ActiveRecord::Migration
  def self.up
    add_column :deputies, :pc_img, :string
    add_column :deputies, :pc_profile, :string
  end

  def self.down
    remove_column :deputies, :pc_profile
    remove_column :deputies, :pc_img
  end
end
