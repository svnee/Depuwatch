class AddFavoriteToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :favorite, :integer
  end

  def self.down
    remove_column :texts, :favorite
  end
end
