# README
fork
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname        |string|null: false|
|family_name     |string|null: false|
|family_name_kana|string|null: false|
|first_name      |string|null: false|
|first_name_kana |string|null: false|
|birth_year      |string|null: false|
|birth_month     |string|null: false|
|birth_day       |string|null: false|
|password	       |string|null: false|
|email           |string|null: false, unique: true|
|image           |string|
### Association
- has_many :items
- has many :points dependent: :destroy
- has_one  :deliver_adresses dependent: :destroy

# 購入商品届け先
## deliver_adressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id         |references|null: false, FK: true|
|family_name     |string    |null: false|
|family_name_kana|string    |null: false|
|first_name	     |string    |null: false|
|first_name_kana |string    |null: false|
|postal_code     |integer   |null: false|  郵便番号
|prefecture	     |string	  |null: false|  県
|city	           |string	  |null: false|  市
|adress1	       |string	  |null: false|  
|adress2	       |string	  |
|telephone	     |string	  |unique: true|
### Association
- belongs_to :user

# 評価テーブル
## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|rederences|null: false, FK: true|
|score  |imteger	 |null: false|
### Association
- belong_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id   |references|	null: false, FK: true|
|shipping_id	 |references|	null: false. FK: true|
|brand_id	     |references|	null: false. FK: true|
|seller_user_id|references|null: false, FK: true|
|name	         |string  |null: false|
|text	         |text	  |null: false|
|condition     |integer |null: false|
|price	       |integer |null: false|
|trading_status|integer |null: false|  売り切れ
|completed_at	 |datetime|              
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_one :shipping
- has_many :item_images dependent: :destroy
- belongs_to :size

# 商品イメージ
## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id	|references|null: false, FK: true|
|image_url|string    |null: false|
### Association
- belongs_to :item


# カテゴリー
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name	   |string|null: false|
|ancestry|string|
### Aaocciation
- has_many :brands
- has_many :items

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|kind	   |string|null: false|
|ancestry|string|
### Asociation
- has_many :items

# ブランドテーブル
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, FK: true|
|name	      |string	   |null: false|
### Association
- has_many :items
- belongs_to :category


# 運送方法
## shippingsテーブル
|Column|Type|Options|
|------|----|-------|
|fee_burden   |boolean|null: false|
|area	        |integer|null: false|
|handling_time|integer|null: false|
### Asociation
- belongs_to :item