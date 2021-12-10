class NormalizeGranuleClassNames < ActiveRecord::Migration[6.0]
  def self.up
    execute "update entries set granule_class = 'UNKNOWN' where granule_class = ''"
    execute "update entries set granule_class = 'UNKNOWN' where granule_class = 'SUNSHINE'"
  end

  def self.down
  end
end
