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
|image|string|

### Association
- has_one :user_address
- has_one :credit_card
- has_many :products

--------------------------------------------------------------

## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|address_last_name|string|null: false|
|address_first_name|string|null: false|
|address_last_name_kana|string|null: false|
|address_first_name_kana|string|null: false|
|zip_code|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|street|string|null: false|
|building_name|string|
|phone_number|string|unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash:prefecture

--------------------------------------------------------------

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|customer_id|string|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user

--------------------------------------------------------------

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|product_status|integer|null: false|
|buyer_address|references|null: false, foreign_key: true|
|prefecture_id|integer|null: false|
|size|integer|
|shipping_day|integer|null: false|
|delivery_type|integer|null: false|
|delivery_fee|integer|null: false|
|category|references|null: false, foreign_key: true|
|trading_status|integer|null: false|
|seller|references|null: false, foreign_key: { to_table: :users }|
|buyer|references|foreign_key: { to_table: :users }|
|deal_closed_date|timestamp|

### Association
- has_many :product_images, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :seller
- belongs_to :buyer
- belongs_to_active_hash:prefecture

--------------------------------------------------------------

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_one:product

--------------------------------------------------------------

## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|product|references|null:false, foreign_key:true|

### Association
- belongs_to :product

--------------------------------------------------------------

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|

### Association
- has_ancestry
- has_many :products
