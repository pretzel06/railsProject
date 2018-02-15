class AddProductRefToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :product, foreign_key: true
  end
end
