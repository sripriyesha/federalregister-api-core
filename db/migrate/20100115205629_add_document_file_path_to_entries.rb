class AddDocumentFilePathToEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :document_file_path, :string
  end

  def self.down
    remove_column :entries, :document_file_path
  end
end
