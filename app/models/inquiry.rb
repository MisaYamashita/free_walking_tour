class Inquiry < ApplicationRecord
  validates :name, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
                      
  validates :title, length: { maximum: 50 }
                      
  validates :message, presence: true, length: { maximum: 1000 }
end
