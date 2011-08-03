class CreateLegislations < ActiveRecord::Migration
  def self.up
    create_table :legislations do |t|
      t.date :start
      t.date :end

      t.timestamps
    end
  end

  def self.down
    drop_table :legislations
  end
end
