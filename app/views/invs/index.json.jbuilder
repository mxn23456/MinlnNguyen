json.array!(@invs) do |inv|
  json.extract! inv, :id, :inv_desc, :notes
  json.url inv_url(inv, format: :json)
end
