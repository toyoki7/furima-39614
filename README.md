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
|name    |string|null: false|
|email   |string|null: false|
|password|string|null: false|

### Association
has_many :products
has_many :purchase

## productsテーブル

|Column  |Type  |Options    |
|stock   |string|null: false|
|category|text  |null: false|
|price   |text  |null: false|
|seller  |string|null: false|

### Association
belongs_to :users
has_one : purchase

## purchaseテーブル

|Column|Type|Options|
|buyer |string|null: false|
|goods |text  |null: false|

### Association
belongs_to :users
belongs_to :products
has_many :shipping

## shippingテーブル

|Column     |Type  |Options    |
|sender     |string|null: false|
|information|text  |null: false|


### Association
belongs_to :purchase