class CreateEntryDetails < ActiveRecord::Migration[6.0]
  def self.up
    create_table :entry_details do |t|
      t.integer :entry_id
      t.text :full_text_raw
    end
    add_index :entry_details, :entry_id

    execute "INSERT INTO entry_details (entry_id, full_text_raw)
             SELECT id, full_text_raw
             FROM entries"

    remove_column :entries, :full_text_raw
    remove_column :entries, :full_text
  end

  def self.down
    raise "NOT IMPLEMENTED"
  end
end
