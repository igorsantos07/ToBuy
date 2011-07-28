class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :limit => 20, :null => false
      t.string :password, :limit => 40, :null => false
    end
		add_index :users, :login, :unique => true
  end

  def self.down
    drop_table :users
  end
end