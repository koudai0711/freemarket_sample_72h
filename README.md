# README

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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|user_image|string|
|introduction|text|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|


### Association
- has_many :products dependent: :destroy
- belongs_to :destination
- has_many :cards dependent: :destroy
- has_many :addresses dependent: :destroy

## productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|description|string|null: false|
|size|string|null: false|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|status|string|null: false|
|prefecture_id|string|null: false|
|shipping_cost|string|null: false|
|shipping_days|string|null: false|
|shipping_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user 
- belongs_to :category
- belongs_to :brand
- has_many :images dependent: :destroy
- belongs_to_active_hash :prefecture


## destinationテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,  foreign_key: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|


### Association
- belongs_to :user
- has_many :addresses dependent: :destroy



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false foreign_key: true|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|

### Association
- belongs_to :user
- belongs_to :destination



## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products dependent: :destroy


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
### Association
- has_many :products dependent: :destroy


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user