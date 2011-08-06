class AddCommentToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :comment, :text, :null => true
  end

  def self.down
    remove_column :items, :comment
  end
end
