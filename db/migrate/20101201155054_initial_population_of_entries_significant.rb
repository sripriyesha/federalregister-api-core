class InitialPopulationOfEntriesSignificant < ActiveRecord::Migration[6.0]
  def self.up
    execute("UPDATE entries, entry_regulation_id_numbers, regulatory_plans
    SET entries.significant = 1
    WHERE entry_regulation_id_numbers.entry_id = entries.id
    AND entry_regulation_id_numbers.regulation_id_number = regulatory_plans.regulation_id_number
    AND regulatory_plans.issue = '201004'
    AND (regulatory_plans.priority_category = 'Economically Significant' OR regulatory_plans.priority_category = 'Other Significant')
    ")
  end

  def self.down
  end
end
