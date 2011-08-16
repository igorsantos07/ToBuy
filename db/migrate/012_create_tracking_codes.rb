class CreateTrackingCodes < ActiveRecord::Migration
  def self.up
    create_table :tracking_codes do |t|
      t.string :code, :limit => 20, :null => false
      t.references :list
      t.references :tracking_system
    end
  end

  def self.down
    drop_table :tracking_codes
  end
end