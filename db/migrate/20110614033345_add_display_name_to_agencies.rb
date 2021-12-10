class AddDisplayNameToAgencies < ActiveRecord::Migration[6.0]
  def self.up
    add_column :agencies, :display_name, :string
  end

  def self.down
    remove_column :agencies, :display_name
  end
end
