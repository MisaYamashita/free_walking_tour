class TourContact < ApplicationRecord
  
  validates :tour_id, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
                      
  validates :message, presence: true
                      
                      
  belongs_to :tour
  has_many :reviews
end
