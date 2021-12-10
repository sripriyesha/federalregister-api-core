class CreatePlaceDeterminations < ActiveRecord::Migration[6.0]
  def self.up
    create_table :place_determinations do |t|
      t.belongs_to :entry
      t.belongs_to :place
      t.string :string, :context
      t.integer :confidence
    end

    add_index :place_determinations, [:entry_id, :confidence]
    add_index :place_determinations, [:place_id, :confidence]
  end

  def self.down
    drop_table :place_determinations
  end
end
