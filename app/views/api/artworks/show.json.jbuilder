current_user_stacked_work_ids = (current_user ? current_user.stacks.map(&:artwork_id) : [])

json.extract! @artwork, :id, :title, :image, :art_type, :created_at
json.image @artwork.image.url(:large)
json.full_size_url @artwork.image.url

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

if current_user_stacked_work_ids.include?(@artwork.id)
  json.stacked true
  json.stack_id Stack.find_by(artwork_id: @artwork.id, user_id: current_user.id).id
else
  json.stacked false
end

# good
