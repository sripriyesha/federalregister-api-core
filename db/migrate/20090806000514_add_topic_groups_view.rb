class AddTopicGroupsView < ActiveRecord::Migration[6.0]
  def self.up
    execute "CREATE VIEW topic_groups
             AS SELECT group_name, name, SUM(entries_count) AS entries_count
                FROM topics
                GROUP BY group_name
                ORDER BY LENGTH(name)"
  end

  def self.down
    execute "DROP VIEW topic_groups"
  end
end
