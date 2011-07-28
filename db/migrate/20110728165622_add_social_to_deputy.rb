class AddSocialToDeputy < ActiveRecord::Migration
  def self.up
    add_column :deputies, :facebook, :string
    add_column :deputies, :twitter, :string
  end

  def self.down
    remove_column :deputies, :twitter
    remove_column :deputies, :facebook
  end
end
