class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :name, :quantity, :total_cost, :customer_id, :product_id, presence: true
end
