class AddInvertedIndexToRegulatoryPlans < ActiveRecord::Migration[6.0]
  def self.up
    add_index :regulatory_plans, [:issue, :regulation_id_number]
  end

  def self.down
    remove_index :regulatory_plans, [:issue, :regulation_id_number]
  end
end
