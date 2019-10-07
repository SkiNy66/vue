json.array! @clients do |client|
  json.id client[:id]
  json.full_name client[:full_name]
  json.email client[:email]
  json.phone client[:phone]
  json.organization_ids do
    json.array! client.organizations.map(&:id)
  end
end 