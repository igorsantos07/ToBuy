class Item < ActiveRecord::Base
  belongs_to :list, :counter_cache => true

  def self.format_price price, currency_symbol
    price.sub(currency_symbol+' ','').gsub('.','').sub(',','.')
  end

  def displayable_name
    if self[:name].nil?
      nil
    elsif !self[:name].empty?
      self[:name]
    elsif !code.empty?
      '<tt>#'+code.to_s+'</tt>'
    elsif !url.empty?
      short_url
    else
      'Item #'+self.id.to_s
    end
  end

  def short_url
    if self.url.empty?
      ''
    else
      self.url.split('http://www.').last.split('http://').last
    end
  end
end