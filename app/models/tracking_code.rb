class TrackingCode < ActiveRecord::Base
  belongs_to :tracking_system

  before_save {|reg| reg.code.strip! }

  def url
    case tracking_system.method.upcase
    when 'GET'
      tracking_system.url % self[:code]
    when 'POST'
      '#'
    end
  end
end
