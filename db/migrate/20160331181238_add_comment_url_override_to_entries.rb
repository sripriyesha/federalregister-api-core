class AddCommentUrlOverrideToEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :comment_url_override, :string
  end

  def self.down
    remove_column :entries, :comment_url_override
  end
end
