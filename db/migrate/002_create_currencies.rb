class CreateCurrencies < ActiveRecord::Migration
  def self.up
    create_table :currencies do |t|
      t.string :code, :limit => 3, :null => false
      t.string :name, :limit => 30, :null => false
      t.string :symbol, :limit => 4, :null => false
    end
		add_index :currencies, :code, :unique => true
		add_index :currencies, :name, :unique => true
  end

  def self.down
    drop_table :currencies
  end
end
