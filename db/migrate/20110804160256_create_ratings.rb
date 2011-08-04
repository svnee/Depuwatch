class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :text_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
