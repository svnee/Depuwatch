class AddUpdatedAtToText < ActiveRecord::Migration
  def self.up
    add_column :texts, :updated_at, :datetime
  end

  def self.down
    remove_column :texts, :updated_at
  end
end
