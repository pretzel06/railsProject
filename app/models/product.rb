class Product < ApplicationRecord
  has_many :transactions
  has_many :customers, through: :transactions
  has_many :stores

  validates :product_name, :product_quantity, :product_price, presence: true
end
