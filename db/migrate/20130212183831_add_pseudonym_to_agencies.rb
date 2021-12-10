class AddPseudonymToAgencies < ActiveRecord::Migration[6.0]
  def self.up
    add_column :agencies, :pseudonym, :string
  end

  def self.down
    remove_column :agencies, :pseudonym, :string
  end
end
