class Image < ApplicationRecord
  belongs_to :tour
  
  #ツアー画像用
  mount_uploader :src, ImageUploader
  
end
