class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :code, :limit => 30, :null => true
      t.string :name, :limit => 100, :null => true
      t.column :price, 'numeric', :null => true
      t.text :url, :null => true
      t.references :list
    end
		add_index :items, :list_id
  end

  def self.down
    drop_table :items
  end
end
