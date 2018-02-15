class CreateStores < ActiveRecord::Migration[5.1]
  def change
    drop_table :stores
    create_table :stores do |t|
      t.string :store_name

      t.timestamps
    end
  end
end
