class Event < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :city, :latitude, :longitude, :title, :when, :hashtag  
  validates :title, {
    uniqueness: true, 
    presence: true
  }
  validates :hashtag, {
    presence: true, 
    format: { 
      with: /#[a-zA-Z0-9]+/, 
      message: "Hashtags must start with #" 
    }
  }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
