class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    drop_table :customers
    create_table :customers do |t|
      t.string :customer_name
      t.string :customer_address

      t.timestamps
    end
  end
end
