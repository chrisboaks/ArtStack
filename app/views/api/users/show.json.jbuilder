current_user_stacked_work_ids = (current_user ? current_user.stacks.map(&:artwork_id) : [])

json.extract! @user, :email, :id

json.moniker User.moniker(@user)

if @user.user_profile
json.user_profile do
  json.extract! @user.user_profile,
    :username,
    :first_name,
    :location,
    :bio,
    :is_artist,
    :is_art_professional,
    :is_collector,
    :is_curator,
    :is_art_writer,
    :is_student,
    :website

  end
end

user_artworks = (@user.uploaded_works + @user.stacked_works).uniq

json.user_artworks do
  json.array! user_artworks do |artwork|

    if current_user_stacked_work_ids.include?(artwork.id)
      json.stacked true
      json.stack_id Stack.find_by(artwork_id: artwork.id, user_id: current_user.id).id
    else
      json.stacked false
    end

    json.image artwork.image.url(:large)

    json.extract! artwork, :id, :title, :art_type

    json.artist_id artwork.artist.id
    json.artist_name artwork.artist.name

  end
end
