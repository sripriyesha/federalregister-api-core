class AddRefererToEntryPageViews < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entry_page_views, :raw_referer, :text
  end

  def self.down
    remove_column :entry_page_views, :raw_referer
  end
end
