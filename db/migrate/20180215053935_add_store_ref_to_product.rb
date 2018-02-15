class AddStoreRefToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :store, foreign_key: true
  end
end
