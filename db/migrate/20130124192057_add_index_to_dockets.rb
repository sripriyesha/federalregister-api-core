class AddIndexToDockets < ActiveRecord::Migration[6.0]
  def self.up
    execute("ALTER TABLE dockets ADD PRIMARY KEY (id)")
  end

  def self.down
    execute("ALTER TABLE dockets DROP PRIMARY KEY (id)")
  end
end
