class AddCounterColumns < ActiveRecord::Migration
  def self.up
    options = { :null => false, :default => 0 }
    add_column :lists, :items_count, :integer, options
    add_column :accounts, :lists_count, :integer, options

    execute 'UPDATE lists SET items_count = (SELECT COUNT(*) FROM items WHERE items.list_id = lists.id)'
    execute 'UPDATE accounts SET lists_count = (SELECT COUNT(*) FROM lists WHERE lists.account_id = accounts.id)'
  end

  def self.down
    remove_column :lists, :items_count
    remove_column :accounts, :lists_count
  end
end