class Tour < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :detail, presence: true
  validates :address, presence: true
  #validates :latitude, presence: true
  #validates :longitude, presence: true
  
  #ツアー一覧はツアー開催日順に表示する
  default_scope -> { order(date: :asc) }
  
  #gmapについて
  geocoded_by :address #addressカラムを基準に緯度経度を算出する
  after_validation :geocode, if: :address_changed? #住所変更時に緯度経度も変更する
  
  belongs_to :user
  has_many :user_tours
  has_many :users, through: :user_tours
  
  def self.search(search) #self.はTour.を意味する
    if search
      where(['address LIKE ?', "%#{search}%"]) #検索とaddressの部分一致を表示する
    else
      all
    end
  end
  
end
 