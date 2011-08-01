class Item < ActiveRecord::Base
  def displayable_name
    if !self.name.empty?
      name
    elsif !self.code.empty?
      code.to_s
    elsif !self.url.empty?
      url
    else
      'Item #'+self.id.to_s
    end
  end
end