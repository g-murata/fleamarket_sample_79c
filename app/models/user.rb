class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }

  has_one :user_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy
end
