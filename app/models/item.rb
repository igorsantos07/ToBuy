class Item < ActiveRecord::Base

  def name
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

  def list
    List.find self.list_id
  end

  def short_url
    if self.url.empty?
      ''
    else
      self.url.split('http://www.').last.split('http://').last
    end
  end
end