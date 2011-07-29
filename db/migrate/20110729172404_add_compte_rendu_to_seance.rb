class AddCompteRenduToSeance < ActiveRecord::Migration
  def self.up
    add_column :seances, :compte_rendu, :string
  end

  def self.down
    remove_column :seances, :compte_rendu
  end
end
