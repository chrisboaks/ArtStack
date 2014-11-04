json.extract! @artist, :id, :name

json.artworks @artist.artworks do |artwork|
  json.extract! artwork, :id, :title, :image, :art_type, :created_at
end
