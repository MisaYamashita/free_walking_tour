class Tour < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :detail, presence: true
  validates :address, presence: true
  #validates :latitude, presence: true
  #validates :longitude, presence: true
  
  #gmapについて
  geocoded_by :address #addressカラムを基準に緯度経度を算出する
  after_validation :geocode, if: :address_changed? #住所変更時に緯度経度も変更する
  
  has_many :user, through: :user_tours
end
