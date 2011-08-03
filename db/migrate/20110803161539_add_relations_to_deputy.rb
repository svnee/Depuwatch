class AddRelationsToDeputy < ActiveRecord::Migration
  def self.up
    add_column :deputies, :predecessor_id, :integer
    add_column :deputies, :successor_id, :integer
  end

  def self.down
    remove_column :deputies, :successor_id
    remove_column :deputies, :predecessor_id
  end
end
