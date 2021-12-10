class CreateUrlReferences < ActiveRecord::Migration[6.0]
  def self.up
    create_table :url_references do |t|
      t.belongs_to :url
      t.belongs_to :entry
      t.timestamps
    end
  end

  def self.down
    drop_table :url_references
  end
end
