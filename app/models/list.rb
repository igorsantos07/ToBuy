class List < ActiveRecord::Base
  has_many :items
  has_many :tracking_codes
  belongs_to :currency
  belongs_to :account, :counter_cache => true

  def name
    if self[:name].nil?
      nil
    elsif !self[:name].empty?
      self[:name]
    else
      'Lista #'+self.id.to_s
    end
  end

  def total
    items.collect { |i| i.price || 0 }.sum
  end

end