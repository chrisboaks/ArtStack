json.array! @artists do |artist|
  json.extract! artist, :id, :name
end