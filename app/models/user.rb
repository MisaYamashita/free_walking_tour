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
  has_many :tours
  has_many :joined_tours, through: :user_tours, source: 'tour' #ユーザーが参加するツアーリスト
  
  
  accepts_nested_attributes_for :user_tours, allow_destroy: true  #親モデルの更新の時、子モデルもまとめて更新できるようにする
  
  def self.search(search) #アドミンページのユーザー検索
    if search  
      where(['name LIKE ?', "%#{search}%"])   
    else  
      all  
    end  
  end
end
