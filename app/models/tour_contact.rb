class TourContact < ApplicationRecord
  validates :name, length: { maximum: 50 }
  validates :tour_id, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
                      
  validates :message, presence: true, length: { maximum: 1000 }
                      
                      
  belongs_to :tour
  has_many :reviews
end
