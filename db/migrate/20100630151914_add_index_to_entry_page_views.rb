class AddIndexToEntryPageViews < ActiveRecord::Migration[6.0]
  def self.up
    add_index :entry_page_views, :created_at
  end

  def self.down
    remove_index :entry_page_views, :created_at
  end
end
