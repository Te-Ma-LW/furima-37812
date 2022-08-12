class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status

  validates :name, :description, :category_id, :product_status_id, presence: true
  validates :product_status_id, numericality: { other_than: 1, message: "can't be blank" }



  belongs_to :user
  has_one_attached :image

end
