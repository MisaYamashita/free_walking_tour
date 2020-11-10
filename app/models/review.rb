class Review < ApplicationRecord
  validates :user_id, presence: true
  validates :tour_id, presence: true
  validates :body, length: { maximum: 500 }
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,      #星評価は1~5
    greater_than_or_equal_to: 0.5
  }, presence: true
  
  belongs_to :tour
  belongs_to :user
  
  scope :id_index, -> (tour_id) {Review.where(tour_id)} #tour_idごとの一覧を表示する
end
