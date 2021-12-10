class UseInnodbEverywhere < ActiveRecord::Migration[6.0]
  def self.up
    connection.select_values("SHOW TABLES").each do |table_name|
      puts "converting #{table_name} to INNODB..."
      connection.execute("ALTER TABLE #{table_name} ENGINE = INNODB;")
    end
  end

  def self.down
  end
end
