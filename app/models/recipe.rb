class Recipe < ApplicationRecord
  belongs_to :user
  
  def as_json
    {
      name: name,
      yumID: yumID,
      image_url: image_url
    }
  end

end
