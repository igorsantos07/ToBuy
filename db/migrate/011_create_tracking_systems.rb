class CreateTrackingSystems < ActiveRecord::Migration
  def self.up
    create_table :tracking_systems do |t|
      t.string :name, :limit => 20, :null => false
      t.string :url, :limit => 250
    end
		add_index :tracking_systems, :name, :unique => true

    TrackingSystem.new({:name => 'Correios', :url => 'http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI=%s'})
    TrackingSystem.new({:name => 'Muambator', :url => 'http://muambator.com.br/view/%s'})
    TrackingSystem.new({:name => 'EMS'})
  end

  def self.down
    drop_table :tracking_systems
  end
end