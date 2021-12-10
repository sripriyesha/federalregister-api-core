class AddProclamationNumberToEntries < ActiveRecord::Migration[6.0]
  def self.up
    add_column :entries, :proclamation_number, :string
    add_index :entries, :proclamation_number
  end

  def self.down
  end
end
