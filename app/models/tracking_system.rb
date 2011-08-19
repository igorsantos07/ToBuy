class TrackingSystem < ActiveRecord::Base

  def param_name
    return self[:url][/\?\w*=/][1..-2]
  end

  def clean_url
    return self[:url][/.*\?/][0..-2]
  end
end