class Image < ApplicationRecord
  validates :src, presence: true
  
  belongs_to :tour
  
  #ツアー画像用
  mount_uploader :src, ImageUploader
  
end
