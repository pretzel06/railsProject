class Store < ApplicationRecord
  has_many :products

  validates :store_name, presence: true
end
