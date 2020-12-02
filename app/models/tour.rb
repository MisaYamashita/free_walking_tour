class Tour < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :detail, presence: true, length: { maximum: 1500 }
  validates :address, presence: true
  validate :tour_day #空白と過去の日付は指定できない。下部にメソッドあり
  
  #ツアー一覧はツアー開催日順に表示する
  default_scope -> { order(date: :asc) }
  
  
  #gmapについて
  geocoded_by :address #addressカラムを基準に緯度経度を算出する
  after_validation :geocode, if: :address_changed? #住所変更時に緯度経度も変更する
  
  belongs_to :user
  has_many :user_tours
  has_many :joined_users, through: :user_tours, source: 'user' #ツアーに参加するユーザーリスト
  has_many :tour_contacts
  has_many :reviews
  has_many :reviewed_users, through: :reviews, source: 'user' #レビューを書いたユーザーリスト
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true #削除フラグで削除できるようallow_destroy: trueをつける
  
  scope :from_today, -> {where("date > ?", Date.today)}
  
  #ツアー検索
  def self.search(search) #self.はTour.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とaddressの部分一致を表示する
    else
      all
    end
  end
  
  def tour_day
    validate_date = Date.tomorrow
    if date == nil || date < validate_date.beginning_of_day
      errors.add(:date, "は明日以降を選択してください")
    end
  end 
end
 