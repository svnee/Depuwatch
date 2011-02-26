class CreateTextTopics < ActiveRecord::Migration
  def self.up
    create_table :text_topics do |t|
      t.integer :text_id
      t.integer :topic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :text_topics
  end
end
