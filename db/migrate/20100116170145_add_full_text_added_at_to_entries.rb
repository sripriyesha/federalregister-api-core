class AddFullTextAddedAtToEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :full_text_added_at, :datetime
    add_index :entries, :full_text_added_at
  end

  def self.down
    remove_column :entries, :full_text_added_at, :datetime
  end
end
