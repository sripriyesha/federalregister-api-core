class AddFullTextFieldsToEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :full_text, :text
    add_column :entries, :full_text_raw, :text
  end

  def self.down
    remove_column :entries, :full_text_raw
    remove_column :entries, :full_text
  end
end
