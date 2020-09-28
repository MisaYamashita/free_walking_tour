class Profile < ApplicationRecord
  validate:profile, length: {maximum: 1000} 
  validate:picture_size
  
end

private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "画像のサイズを5MB以下にしてください")
    end
  end
  
  
