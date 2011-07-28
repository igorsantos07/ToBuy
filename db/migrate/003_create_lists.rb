class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name, :limit => 49, :null => false
			t.references :user
			t.references :currency
    end
		add_index :lists, :user_id
		add_index :lists, :currency_id
  end

  def self.down
    drop_table :lists
  end
end
