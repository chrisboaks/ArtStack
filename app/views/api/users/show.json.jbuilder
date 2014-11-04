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
    json.stacked current_user_stacked_work_ids.include?(artwork.id)
    json.extract! artwork,
      :id,
      :artist_id,
      :title,
      :art_type,
      :image_file_name
  end
end

user_artists = (@user.uploaded_artists + @user.stacked_artists).uniq

json.user_artists do
  json.array! user_artists do |artist|
    json.extract! artist, :id, :name
  end
end

