class AddFeaturedToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :featured, :string
  end

  def self.down
    remove_column :texts, :featured
  end
end
