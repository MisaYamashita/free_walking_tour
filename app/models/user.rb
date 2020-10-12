class User < ApplicationRecord
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #一意性の確認と、{大文字小文字の区別をしないという設定}
  
  VALID_PASSWORD_REGEX = /\A[a-z0-9]{8,32}+\z/i   #半角英数字8-32文字               
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  has_secure_password
  
  has_one :profile, dependent: :destroy
  has_many :user_tours, dependent: :destroy
  has_many :tours, through: :user_tours
  accepts_nested_attributes_for :user_tours, allow_destroy: true
  
  
  #参加するメソッド
  def add_tour(tour)
    user_tours.find_or_create_by(tour_id: @tour.id)
  end 
  
  #参加を中止するメソッド
  def remove_tour(tour)
    user_tour = user_tours.find_by(tour_id: @tour.id)
    user_tour.destroy if user_tour
  end 
  
  def check_added?(tour)
    self.tours.include?(@tour)  #self.toursのtoursはhas_manyで定義したものなので、モデルで複数形で定義していたら同じにする
  end 
    
end
