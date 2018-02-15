class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    drop_table :transactions
    create_table :transactions do |t|

      t.timestamps
    end
  end
end
