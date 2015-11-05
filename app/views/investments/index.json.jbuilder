json.array!(@investments) do |investment|
  json.extract! investment, :id, :investment_desc, :notes
  json.url investment_url(investment, format: :json)
end
