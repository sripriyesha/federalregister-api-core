class AddReverseIndexToSectionAssignments < ActiveRecord::Migration[6.0]
  def self.up
    add_index :section_assignments, [:entry_id, :section_id]
  end

  def self.down
    remove_index :section_assignments, [:entry_id, :section_id]
  end
end
