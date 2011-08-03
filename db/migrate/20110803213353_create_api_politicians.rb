class CreateApiPoliticians < ActiveRecord::Migration
  def self.up
    create_table :api_politicians do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :api_politicians
  end
end
