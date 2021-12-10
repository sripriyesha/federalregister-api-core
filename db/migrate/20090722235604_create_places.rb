class CreatePlaces < ActiveRecord::Migration[6.0]
  def self.up
    create_table :places do |t|
      t.string :name, :place_type
      t.float :latitude, :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
