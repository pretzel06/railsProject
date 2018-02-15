# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#add json helper
require 'json'

#clear the data in the table for now
Customer.destroy_all
Store.destroy_all
Product.destroy_all

5.times do
  Customer.create(customer_name: Faker::GameOfThrones.character,
                  customer_address: Faker::Address.state)
end
puts "my customer count: #{Customer.count}"

#read json file from path rails.root
data = JSON.parse(open("#{Rails.root}/data.json").read)

data.each do |store|
  Store.create(store_name: store['store'])

  last_store_name = Store.last
  store_id = Store.where(:id => last_store_name.id)
  store['result'].each do |product|
      Product.create(product_name: product['item_name'],
                     product_quantity: Faker::Number.number(2),
                     product_price: product['item_sale_price'],
                     store_id: store_id)
  end
end

puts "my store count: #{Store.count}"
puts "my product count: #{Product.count}"