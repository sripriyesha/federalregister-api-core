class IncreaseCuratedAbstractLength < ActiveRecord::Migration[6.0]
  def self.up
    change_column :entries, :curated_abstract, :string, :limit => 500
  end

  def self.down
    change_column :entries, :curated_abstract, :string, :limit => 255
  end
end
