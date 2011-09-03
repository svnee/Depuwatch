class AddFormulaireToDeputies < ActiveRecord::Migration
  def self.up
    add_column :deputies, :formulaire, :string
  end

  def self.down
    remove_column :deputies, :formulaire
  end
end
