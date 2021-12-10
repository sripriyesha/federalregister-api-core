class MergeReferencedDatesIntoEvents < ActiveRecord::Migration[6.0]
  def self.up
    add_column :events, :event_type, :string
    add_index :events, :event_type
    drop_table :referenced_dates
  end

  def self.down
    remove_index :events, :event_type
    remove_column :events, :event_type
    execute "DELETE FROM events WHERE id > 18"
    create_table "referenced_dates", :force => true do |t|
      t.integer  "entry_id"
      t.date     "date"
      t.string   "string"
      t.string   "context"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "date_type"
    end
  end
end
