class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_days
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name, :image, :description, :category_id, :status_id, :prefecture_id, :shopping_days_id, :shipping_charge_id,
             presence: true
  validates :category_id, :status_id, :prefecture_id, :shopping_days_id, :shipping_charge_id,
            numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
end
