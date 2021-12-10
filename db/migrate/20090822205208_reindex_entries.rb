class ReindexEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_index :entries, [:id, :publication_date]
  end

  def self.down
    remove_index :entries, [:id, :publication_date]
  end
end
