class CreateSiteNotifications < ActiveRecord::Migration[6.0]
  def self.up
    create_table :site_notifications do |t|
      t.string :identifier
      t.string :notification_type
      t.text :description
      t.boolean :active
    end
  end

  def self.down
    drop_table :site_notifications
  end
end
