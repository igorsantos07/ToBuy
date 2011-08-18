class AddMethodToTrackingSystems < ActiveRecord::Migration
  def self.up
    add_column :tracking_systems, :method, :string, :null => false, :default => 'GET'
  end

  def self.down
    remove_column :tracking_systems, :method
  end
end
