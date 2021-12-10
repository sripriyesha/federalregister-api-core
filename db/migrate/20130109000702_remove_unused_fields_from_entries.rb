class RemoveUnusedFieldsFromEntries < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :entries, :type
    remove_column :entries, :link
    remove_column :entries, :genre
    remove_column :entries, :length
    remove_column :entries, :slug
  end

  def self.down
    add_column :entries, :type, :string
    add_column :entries, :link, :string
    add_column :entries, :genre, :string
    add_column :entries, :length, :string
    add_column :entries, :slug, :string
  end
end
