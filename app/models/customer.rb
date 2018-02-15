class Customer < ApplicationRecord
  has_many :transactions
  has_many :products, through: :transactions

  validates :customer_name, :customer_address, presence: true
end
