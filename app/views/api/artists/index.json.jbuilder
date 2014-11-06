current_user_stacked_work_ids = (current_user ? current_user.stacks.map(&:artwork_id) : [])

json.array! @artists do |artist|
  json.id artist.id
  json.name artist.name

  json.artworks artist.artworks do |artwork|
    json.extract! artwork, :id, :title, :image, :art_type, :created_at

    if current_user_stacked_work_ids.include?(artwork.id)
      json.stacked true
      json.stack_id Stack.find_by(artwork_id: artwork.id, user_id: current_user.id).id
    else
      json.stacked false
    end

  end

end
