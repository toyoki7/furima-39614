class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :until
  has_one_attached :image

  validates :image, :item, :explanation, :price, presence: true
  validates :category_id, :condition_id, :burden_id, :prefecture_id, :until_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/, message: 'is invalid'}
end
