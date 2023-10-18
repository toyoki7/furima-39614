class OrderIntegration
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipality, :address, :building, :phone, :order, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "should be 10 to 11 digits in length and contain only half-width numbers" }
    validates :token
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Shipping.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone: phone, order_id: order.id)
  end
end