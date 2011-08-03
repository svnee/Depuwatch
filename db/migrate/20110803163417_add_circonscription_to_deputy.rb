class AddCirconscriptionToDeputy < ActiveRecord::Migration
  def self.up
    add_column :deputies, :circonscription, :string
  end

  def self.down
    remove_column :deputies, :circonscription
  end
end
