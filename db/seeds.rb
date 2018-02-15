# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#add json helper
require 'json'
require 'pp'

#clear the data in the table for now
Customer.delete_all
Store.delete_all
Product.delete_all

5.times do
  Customer.create(customer_name: Faker::GameOfThrones.character,
                  customer_address: Faker::Address.state)
end
puts "my customer count: #{Customer.count}"

#read json file from path rails.root
data = JSON.parse(open("#{Rails.root}/data.json").read)

data.each do |store|
  Store.create(store_name: store['store'])

  store_id = Store.last.id

  store['result'].each do |product|
    Product.create(product_name: product['item_name'],
                   product_quantity: Faker::Number.number(2),
                   product_price: product['item_sale_price'],
                   store_id: store_id)
  end
end

puts "my store count: #{Store.count}"
puts "my product count: #{Product.count}"

pp Customer.all
pp Product.all

customers = Customer.all
products = Product.all

customers.each do |customer|
  new_transaction = Transaction.new
  new_transaction.customer_id = customer.id
  new_transaction.name = customer.customer_name
  quantity = Faker::Number.between(1, 9)
  new_transaction.quantity = quantity
  random_product = Faker::Number.between(0, Product.count - 1)
  new_transaction.total_cost = quantity * products[random_product].product_price
  new_transaction.product_id = products[random_product].id

  new_transaction.save
end
