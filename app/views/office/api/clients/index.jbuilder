json.array! @clients do |client|
  json.id client[:id]
  json.full_name client[:full_name]
  json.email client[:email]
  json.phone client[:phone]
end 