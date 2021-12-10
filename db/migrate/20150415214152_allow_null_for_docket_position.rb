class AllowNullForDocketPosition < ActiveRecord::Migration[6.0]
  def self.up
    change_column :docket_numbers, :position, :integer, :null => true
  end

  def self.down
    change_column :docket_numbers, :position, :integer, :null => false
  end
end
