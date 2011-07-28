class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :deputy_id
      t.date :start
      t.date :end

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
