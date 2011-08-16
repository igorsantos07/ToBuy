class AddFinalPriceToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :final_price, 'numeric', :null => true
  end

  def self.down
    remove_column :lists, :final_price
  end
end