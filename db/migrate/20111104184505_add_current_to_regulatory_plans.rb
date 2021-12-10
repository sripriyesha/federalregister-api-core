class AddCurrentToRegulatoryPlans < ActiveRecord::Migration[6.0]
  def self.up
    add_column :regulatory_plans, :current, :boolean
    add_index :regulatory_plans, [:current, :regulation_id_number]
  end

  def self.down
    remove_column :regulatory_plans, :current
  end
end
