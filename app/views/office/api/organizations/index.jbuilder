json.array! @organizations do |organization|
  json.id organization[:id]
  json.title organization[:title]
  json.kind organization[:kind]
  json.iin organization[:iin]
  json.ogrn organization[:ogrn]
  json.client_ids do
    json.array! organization.clients.map(&:id)
  end
end 