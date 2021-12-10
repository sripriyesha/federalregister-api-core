class AddLastPublishedToFrIndexAgencyStatuses < ActiveRecord::Migration[6.0]
  def self.up
    add_column :fr_index_agency_statuses, :last_published, :date
  end

  def self.down
    remove_column :fr_index_agency_statuses, :last_published
  end
end
