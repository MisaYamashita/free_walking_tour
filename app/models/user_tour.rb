class UserTour < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :tour, dependent: :destroy
  
  validates :user_id, presence: true
  validates :tour_id, presence: true
  validates :user_id, :uniqueness => { :scope => :tour_id } #user_idとtour_idの組み合わせが重複しないように
end
