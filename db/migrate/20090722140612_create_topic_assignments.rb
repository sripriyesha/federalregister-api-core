class CreateTopicAssignments < ActiveRecord::Migration[6.0]
  def self.up
    create_table :topic_assignments do |t|
      t.belongs_to :topic
      t.belongs_to :entry
      t.timestamps
    end
  end

  def self.down
    drop_table :topic_assignments
  end
end
