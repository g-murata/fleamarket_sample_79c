class Product < ApplicationRecord
  validates_associated :product_images
  validates :product_images, presence: {message: "を最低1枚選択してください"}

  validates :product_name,  presence: { message: "を入力してください"}, length: { maximum: 40 }
  validates :description,  presence: { message: "を入力してください"}
  validates :prefecture,  presence: { message: "を入力してください"}
  #validates :category_id,  presence: { message: "を入力してください"}
  validates :shipping_day,  presence: { message: "を入力してください"}

  validates :shipping_type,  presence: { message: "を入力してください"}
  validates :shipping_fee,  presence: { message: "を入力してください"}

  validates :price, presence: { message: "を入力してください"}
  validates :price, :numericality => { greater_than: 300, less_than: 50000 } 


  has_many :product_images, dependent: :destroy
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :product_images, allow_destroy: true

  enum status: { 新品・未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5 }
  enum bear: { 送料込み（出品者負担）: 0, 着払い（購入者負担）: 1}
  enum days: { １〜２日で発送: 0, ２〜３日で発送: 1, ４〜７日で発送: 2}
  enum houhou: { 未定: 0, 普通郵便（定形／定形外）: 1, ゆうパック: 2}

end
