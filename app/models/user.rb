class User < ApplicationRecord
  before_save :email_downcase, unless: :uid?
  
  validates :name, presence: true, unless: :uid?, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, unless: :uid?, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #一意性の確認と、{大文字小文字の区別をしないという設定}
  
  VALID_PASSWORD_REGEX = /\A[a-z0-9]{8,32}+\z/i   #半角英数字8-32文字               
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true, unless: :uid?
  has_secure_password
  
  has_one :profile, dependent: :destroy
  has_many :user_tours, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :joined_tours, through: :user_tours, source: 'tour' #ユーザーが参加するツアーリスト
  accepts_nested_attributes_for :user_tours, allow_destroy: true  #親モデルの更新の時、子モデルもまとめて更新できるようにする
  
  scope :join_tours_from_today, -> (id) { User.find(id).joined_tours.where("date > ?", Date.today).limit(5)} #今日以降の参加予定ツアー
  scope :plan_tours_from_today, -> (id) { User.find(id).tours.where("date > ?", Date.today).limit(5)} #今日以降の開催予定ツアー
  scope :joined_tours_past, -> (id) { User.find(id).joined_tours.where("date < ?", Date.today)} #昨日以前の過去に参加したツアー
  scope :planned_tours_past, -> (id) { User.find(id).tours.where("date < ?", Date.today)} #昨日以前の過去に開催したツアー
  
  #アドミンページのユーザー検索
  def self.search(search) 
    if search 
      where(['name LIKE ?', "%#{search}%"])   
    else  
      all  
    end  
  end
  
  #SNS認証ログイン
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    
    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
    end
  end
  
  def email_downcase
    self.email = email.downcase
  end 
end
