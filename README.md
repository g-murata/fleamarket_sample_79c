# Fleamarket_Sample_79C
# DB設計

<img src="https://github.com/TomozQ/fleamarket_sample_79c/blob/master/app/assets/images/er.png?raw=true">

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|encrypeted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_date|date|null: false|
|introduction|string|

### Association
- has_one :user_address, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :comments, dependent: destroy
- has_many :likes, dependent: destroy
- has_many :user_evaluations
- has_many :seller_products, foreign_key: "seller_id"
- has_many :buyer_products, foreign_key: "buyer_id"

--------------------------------------------------------------

## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|address_last_name|string|null: false|
|address_first_name|string|null: false|
|address_last_name_kana|string|null: false|
|address_first_name_kana|string|null: false|
|zip_code|integer(7)|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building_name|string|
|phone_number|integer|unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

--------------------------------------------------------------

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

--------------------------------------------------------------

## evaluations (active_hash)テーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|string|null :false|

### Association
- has_many :user_evaluations

--------------------------------------------------------------

## user_evaluations (active_hash)テーブル
|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
|evaluation|references|null: false, foreign_key: true|

### Association
- belongs_to_active_hash: evaluation
- belongs_to :user
- belongs_to :product

--------------------------------------------------------------

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|product_status|references|null: false, foreign_key: true|
|buyer_address|references|null: false, foreign_key: true|
|prefecture|string|null: false|
|size|references|null: false, foreign_key: true|
|shipping_day|references|null: false, foreign_key: true|
|delivery_type|references|null: false, foreign_key: true|
|picture|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp|

### Association
- has_one :user_evaluation
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :product_images, dependent: :destroy
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :user_address
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :shipping_type
- belongs_to :brand
- belongs_to :seller
- belongs_to :buyer

--------------------------------------------------------------

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :products

--------------------------------------------------------------

## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null:false|
|product|references|null:false, foreign_key:true|

### Association
- belongs_to :product

--------------------------------------------------------------

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false, foreign_key:true|
|product|references|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product

--------------------------------------------------------------

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user|references|null:false, foreign_key:true|
|product|references|null:false, foreign_key:true|
|created_at|timestamp|null:false|

### Association
- belongs_to :user
- belongs_to :product

--------------------------------------------------------------

## sizes (active_hash)テーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null:false|

### Association
- has_many :products

--------------------------------------------------------------

## product_status (active_hash)テーブル
|Column|Type|Options|
|------|----|-------|
|product_status|string|null:false|

### Association
- has_many :products

--------------------------------------------------------------

## buyer_addresses (active_hash)テーブル
|Column|Type|Options|
|------|----|-------|
|buyer_address|string|null:false|

### Association
- has_many :products

--------------------------------------------------------------

## shipping_days (active_hash)テーブル
|Column|Type|Options|
|------|----|-------|
|shipping_days|string|null:false|

### Association
- has_many :products

--------------------------------------------------------------

## shipping_types (active_hash)テーブル
|Column|Type|Options|
|------|----|-------|
|shipping_type|string|null:false|

### Association
- has_many :products
