class AddBoughtToLists < ActiveRecord::Migration
  def self.up
    change_table :lists do |t|
      t.boolean :bought, :null => false, :default => 0
    end
  end

  def self.down
    change_table :lists do |t|
      t.remove :bought
    end
  end
end
