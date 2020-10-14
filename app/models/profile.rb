class Profile < ApplicationRecord
  validates :user_id, presence: true, uniqueness:true
  validates :body, length: {maximum: 1000} 
  #validates :user_image, picture_size
  

  belongs_to :user, inverse_of: :profile
  #accepts_nested_attributes_for :user　#プロフィールで名前を変更できるようにuserをプロフィールにネストする
  
  mount_uploader :image, ImageUploader

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:image, "画像のサイズを5MB以下にしてください")
      end
    end
  
end 
