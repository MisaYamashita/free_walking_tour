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
  
end
