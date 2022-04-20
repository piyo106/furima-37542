class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}, allow_blank: true }
    validates :municipality
    validates :address
    validates :tel, format: { /\A\d{10,11}\z/, message: "is invalid. Input half-width-digit", allow_blank: true }
    validates :user_id
    validates :item_id
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building: building, tel: tel, order_id: order.id)
  end
end