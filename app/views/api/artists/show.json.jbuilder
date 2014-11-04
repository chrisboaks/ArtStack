current_user_stacked_work_ids = (current_user ? current_user.stacks.map(&:artwork_id) : [])

json.extract! @artist, :id, :name

json.artworks @artist.artworks do |artwork|
  json.extract! artwork, :id, :title, :image, :art_type, :created_at
  json.stacked current_user_stacked_work_ids.include?(artwork.id)
end
