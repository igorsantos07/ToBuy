class List < ActiveRecord::Base

  def items_count
    Item.count_by_sql "SELECT COUNT(*) FROM items WHERE list_id = #{self.id}"
  end

end