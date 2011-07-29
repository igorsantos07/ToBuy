class SubstituteUsersByAccounts < ActiveRecord::Migration
  def self.up
    drop_table :users
		rename_column :lists, :user_id, :account_id
  end

  def self.down
    create_table :users do |t|
      t.string :login, :limit => 20, :null => false
      t.string :password, :limit => 40, :null => false
    end
		add_index :users, :login, :unique => true

		rename_column :lists, :account_id, :user_id
  end
end