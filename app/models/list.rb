class List < ActiveRecord::Base
  has_many :items
  belongs_to :currency

  def name
    if self[:name].nil?
      nil
    elsif !self[:name].empty?
      self[:name]
    else
      'Lista #'+self.id.to_s
    end
  end

  def items_count
    Item.count_by_sql "SELECT COUNT(*) FROM items WHERE list_id = #{self.id}"
  end

  def total
    items.collect { |i| i.price || 0 }.sum
  end

end