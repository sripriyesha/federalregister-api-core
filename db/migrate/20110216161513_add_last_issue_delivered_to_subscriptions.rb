class AddLastIssueDeliveredToSubscriptions < ActiveRecord::Migration[6.0]
  def self.up
    add_column :subscriptions, :last_issue_delivered, :date
  end

  def self.down
    remove_column :subscriptions, :last_issue_delivered
  end
end
