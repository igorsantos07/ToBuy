class Item < ActiveRecord::Base
  def displayable_name
    if !self.name.empty?
      name
    elsif !self.code.empty?
      code.to_s
    elsif !self.url.empty?
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