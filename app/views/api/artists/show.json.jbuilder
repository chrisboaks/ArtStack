current_user_stacked_work_ids = (current_user ? current_user.stacks.map(&:artwork_id) : [])

json.extract! @artist, :id, :name

json.artworks @artist.artworks do |artwork|
  json.extract! artwork, :id, :title, :image, :art_type, :created_at
  json.image artwork.image.url(:medium)

  if current_user_stacked_work_ids.include?(artwork.id)
    json.stacked true
    json.stack_id Stack.find_by(artwork_id: artwork.id, user_id: current_user.id).id
  else
    json.stacked false
  end

  json.height artwork.scaled_height_by_width(450)

end

if Follow.find_by(follower: current_user, followable: @artist)
  json.followed true
  json.follow_id Follow.find_by(follower: current_user, followable: @artist).id
else
  json.followed false
end
