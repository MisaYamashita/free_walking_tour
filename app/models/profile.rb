class Profile < ApplicationRecord
  validates :user_id, presence: true, uniqueness:true
  validates :body, length: {maximum: 1000} 
  #validates :image, size_range
  

  belongs_to :user
  
  mount_uploader :image, ImageUploader
  

  private
  
end 
