class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
  validates :nickname
  validates :email
  validates :password, length: { minimum: 7 }
  validates :last_name, /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, /\A[ぁ-んァ-ン一-龥]/
  validates :last_name_kana
  validates :first_name_kana
  validates :birth_day
  
  has_many :items
  has_many :users

end
