class UpdateEntryRins < ActiveRecord::Migration[6.0]
  def self.up
    execute("UPDATE entries SET regulation_id_number = REPLACE(regulation_id_number, 'RIN ', '') WHERE regulation_id_number IS NOT NULL")
  end

  def self.down
    execute("UPDATE entries SET regulation_id_number = CONCAT('RIN ', regulation_id_number) WHERE regulation_id_number IS NOT NULL")
  end
end
