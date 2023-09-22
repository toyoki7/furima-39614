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

|Column            |Type     |Options                 |
|nickname          |string   |null: false             |
|email             |string   |null: false unique: true|
|encrypted_password|string   |null: false             |
|name1             |string   |null: false             |
|name2             |string   |null: false             |
|birth             |date     |null: false             |

### Association
has_many :products
has_many :purchases

## productsテーブル

|Column      |Type   |Options                      |
|stock       |string |null: false                  |
|explanation |text   |null: false                  |
|condition_id|integer|null: false                  |
|burden_id   |integer|null: false                  |
|region_id   |integer|null: false                  |
|until_id    |integer|null: false                  |
|category_id |integer|null: false foreign_key: true|
|price       |integer|null: false                  |


### Association
belongs_to :user
has_one : purchase

## purchasesテーブル

|Column   |Type  |Options     |
|user_id  |string|null: false |
|stock_id |text  |null: false |

### Association
belongs_to :user
belongs_to :product
has_one :shipping

## shippingsテーブル

|Column        |Type  |Options    |
|postcode      |string|null: false|
|prefectures   |string|null: false|
|municipalities|string|null: false|
|address       |string|null: false|
|building      |string|none       |
|phone         |string|null: false|



### Association
belongs_to :purchase