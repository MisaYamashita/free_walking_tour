class Profile < ApplicationRecord
  validates :user_id, presence: true, uniqueness:true
  validates :body, length: {maximum: 1000} 
  

  belongs_to :user
  
  mount_uploader :image, ImageUploader
  

  private
  
end 
