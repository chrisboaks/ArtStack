json.array! @artworks do |artwork|
  json.extract! artwork, :id, :title, :image_url, :art_type, :created_at

  json.artist do
    json.extract! artwork.artist, :id, :name
  end
end

# good