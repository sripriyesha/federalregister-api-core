class ReindexTopics < ActiveRecord::Migration[6.0]
  def self.up
    add_index :topics, [:group_name, :id]
    remove_index :topics, :group_name
  end

  def self.down
    add_index :topics, :group_name
    remove_index :topics, [:group_name, :id]
  end
end
