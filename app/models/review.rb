class Review < ApplicationRecord
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,      #星評価は1~5
    greater_than_or_equal_to: 1
  }, presence: true
  
  
  belongs_to :tour
  belongs_to :user
end
