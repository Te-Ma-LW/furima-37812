class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :product_id,:token
  

  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}, length: {minimum: 10}, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :product_id
  end      
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save 
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id )
  end 

end