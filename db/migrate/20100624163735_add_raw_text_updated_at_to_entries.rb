class AddRawTextUpdatedAtToEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :raw_text_updated_at, :datetime
    add_index :entries, :raw_text_updated_at
  end

  def self.down
    remove_column :entries, :raw_text_updated_at
  end
end
