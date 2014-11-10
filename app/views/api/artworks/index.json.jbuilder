current_user_stacked_work_ids = (current_user ? current_user.stacks.map(&:artwork_id) : [])

json.array! @artworks do |artwork|
  json.extract! artwork, :id, :title, :image, :art_type, :created_at

  json.image_small artwork.image.url(:small)
  json.height_small artwork.scaled_height_by_width(300)
  json.image_large artwork.image.url(:large)
  json.height_large artwork.scaled_height_by_width(900)

  json.artist_name artwork.artist.name
  json.artist_id artwork.artist.id

  if current_user_stacked_work_ids.include?(artwork.id)
    json.stacked true
    json.stack_id Stack.find_by(artwork_id: artwork.id, user_id: current_user.id).id
  else
    json.stacked false
  end

end

# good
