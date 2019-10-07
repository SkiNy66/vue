json.array! @hardwares do |hardware|
  json.id hardware[:id]
  json.title hardware[:title]
  json.kind hardware[:kind]
  json.serial_number hardware[:serial_number]
  json.organization_id hardware[:organization_id]
end 