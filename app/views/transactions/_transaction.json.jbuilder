json.extract! transaction, :id, :name, :quantity, :total_cost, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
