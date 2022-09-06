class Purchase < ApplicationRecord
  # attr_accessor :price, :token

  # validates :price, presence: true
  # validates :token, presence: true

  has_one :destination
  belongs_to :user
  belongs_to :product


end
