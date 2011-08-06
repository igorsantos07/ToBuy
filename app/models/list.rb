class List < ActiveRecord::Base

  def items
    Item.find_all_by_list_id self.id
  end

  def currency
    Currency.find self.currency_id
  end

  def items_count
    Item.count_by_sql "SELECT COUNT(*) FROM items WHERE list_id = #{self.id}"
  end

  def total
    items.collect { |i| i.price || 0 }.sum
  end

end