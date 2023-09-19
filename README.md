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

|Column  |Type  |Options    |
|nickname|string|null: false|
|email   |string|null: false|
|password|string|null: false|
|name    |string|null: false|
|birth   |string|null: false|

### Association
has_many :products
has_many :purchase

## productsテーブル

|Column      |Type   |Options    |
|stock       |string |null: false|
|explanation |text   |null: false|
|condition_id|integer|null: false|
|burden_id   |integer|null: false|
|region_id   |integer|null: false|
|until_id    |integer|null: false|
|category_id |integer|null: false|
|price       |string |null: false|
|seller      |string |null: false|

### Association
belongs_to :user
has_one : purchase

## purchaseテーブル

|Column|Type  |Options                      |
|buyer |string|null: false foreign_key: true|
|goods |text  |null: false foreign_key: true|

### Association
belongs_to :user
belongs_to :product
has_many :shipping

## shippingテーブル

|Column     |Type  |Options    |
|sender     |string|null: false|
|address    |text  |null: false|
|number     |string|null: false|



### Association
belongs_to :purchase