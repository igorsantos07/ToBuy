class Item < ActiveRecord::Base
  def displayable_name
    if !self.name.empty?
      name
    elsif !self.code.empty?
      code
    elsif !self.url.empty?
      url
    else
      'Item #'+self.id
    end
  end
end