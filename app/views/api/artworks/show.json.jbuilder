json.extract! @artwork, :id, :title, :image, :art_type, :created_at

json.artist do
  json.extract! @artwork.artist, :id, :name
end

json.uploader do
  json.extract! @artwork.uploader, :id

  if @artwork.uploader.user_profile
    json.profile do
      json.extract! @artwork.uploader.user_profile, :username
    end
  end
end

