class AddPackageIdentifierToGpoGraphic < ActiveRecord::Migration[6.0]
  def self.up
    add_column :gpo_graphics, :package_identifier, :string
  end

  def self.down
    remove_column :gpo_graphics, :package_identifier
  end
end
