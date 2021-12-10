class CreateActionNames < ActiveRecord::Migration[6.0]
  def self.up
    create_table :action_names do |t|
      t.string :name
      t.timestamps
    end

    add_column :entries, :action_name_id, :integer
  end

  def self.down
    remove_column :entries, :action_name_id

    drop_table :action_names
  end
end
