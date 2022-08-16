class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :user
  has_one_attached :image

  validates :name, :image, :description, :category_id, :product_status_id, :prefecture_id, :scheduled_delivery_id , :shipping_charge_id, :product_price_id, presence: true
  validates :product_status_id, numericality: { other_than: 1, message: "can't be blank" }


  with_options presence: true, format: {with: /\A[0-9]+\z/ } do
    validates :product_price_id, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "can't be blank" }
  end

end
