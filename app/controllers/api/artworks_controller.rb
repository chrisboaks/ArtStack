class Api::ArtworksController < ApplicationController
  def index
    @artworks = Artwork.includes(:artist).order("id ASC").all
    render :index
  end

  def show
    @artwork = Artwork.includes(:artist, uploader: :user_profile).find(params[:id])
    render :show
  end

  def create
    name = params[:artist_name].split.map(&:capitalize).join(' ')
    artist = Artist.find_or_initialize_by(name: name)

    @artwork = artist.artworks.new(artwork_params)
    @artwork.uploader_id = current_user.id

    if @artwork.save
      render :show
    else
      render json:
        { error: "Sorry, there was a problem with that artwork." },
        status: :unprocessable_entity
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    to_stack = params[:stack]

    if to_stack == 'true'
      Stack.create(user: current_user, artwork_id: params[:id])
    else
      stack = Stack.find_by(user_id: current_user.id, artwork_id: params[:id])
      stack.destroy
    end
    render :show
  end
end
