json.array! @stacks do |stack|
  json.extract! stack, :id, :artwork_id
end
