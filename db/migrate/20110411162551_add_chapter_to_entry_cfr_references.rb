class AddChapterToEntryCfrReferences < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entry_cfr_references, :chapter, :integer
  end

  def self.down
    remove_column :entry_cfr_references, :chapter
  end
end
