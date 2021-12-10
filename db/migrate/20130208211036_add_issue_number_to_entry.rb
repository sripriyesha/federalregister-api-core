class AddIssueNumberToEntry < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :issue_number, :integer
  end

  def self.down
    remove_column :entries, :issue_number
  end
end
