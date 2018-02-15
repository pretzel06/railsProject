class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :customer_id, :product_id, presence: true
end
