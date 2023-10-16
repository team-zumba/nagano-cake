class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name_kana, :first_name_kana,　presence: true       
  validates :last_name_kana, :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }  , presence: true 
  validates :email, uniqueness: true, presence: true
  validates :telephone_number, uniqueness: true, presence: true
  validates :postal_code, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  
end
