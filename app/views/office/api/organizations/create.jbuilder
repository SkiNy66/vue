json.organization do
  json.id @organization.id
  json.title @organization.title
  json.kind @organization.kind
  json.iin @organization.iin
  json.ogrn @organization.ogrn
  json.hardware_id @organization.hardware_id
end 
