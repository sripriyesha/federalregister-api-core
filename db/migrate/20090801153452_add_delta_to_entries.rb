class AddDeltaToEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :delta, :boolean, :default => true, :null => false
  end

  def self.down
    remove_column :entries, :delta
  end
end
