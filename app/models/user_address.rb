class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  validates :address_last_name, :address_first_name, :address_last_name_kana, :address_first_name_kana, :zip_code, :prefecture_id, :city, :street, presence: true
  validates :address_last_name_kana, :address_first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :zip_code, format: { with: /\A\d{7}\z/ }
  validates :phone_number, uniqueness: { case_sensitive: true }
end
