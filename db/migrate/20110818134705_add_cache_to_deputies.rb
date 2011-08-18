class AddCacheToDeputies < ActiveRecord::Migration
  def self.up
    add_column :deputies, :presence_cache, :decimal
    add_column :deputies, :delegations_rate_cache, :decimal
    add_column :deputies, :active_cache, :boolean
  end

  def self.down
    remove_column :deputies, :active_cache
    remove_column :deputies, :delegations_rate_cache
    remove_column :deputies, :presence_cache
  end
end
