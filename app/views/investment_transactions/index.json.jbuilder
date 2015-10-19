json.array!(@investment_transactions) do |investment_transaction|
  json.extract! investment_transaction, :id, :amount, :transaction_desc, :transaction_date, :investment_desc
  json.url investment_transaction_url(investment_transaction, format: :json)
end
