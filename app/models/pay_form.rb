class PayForm
  include ActiveModel::Model
  attr_accessor :zip_code, :city, :address, :building, :phone_number, :prefecture_id, :token, :user_id, :item_id

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/} 
    validates :token
    validates :item_id
    validates :user_id
  end
    validates :prefecture_id, numericality: { other_than: 0}
  def save
    orders = Order.create(user_id: user_id, item_id: item_id)

    Destination.create(zip_code: zip_code, city: city, address: address, phone_number: phone_number, building: building, prefecture_id: prefecture_id, order_id: orders.id)
  end
end


