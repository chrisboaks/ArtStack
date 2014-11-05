class ArtworksController < ApplicationController

  def new
    @artwork = Artwork.new
    render :new
  end

  def create
    name = params[:artist_name].titlecase
    @artist = Artist.find_or_initialize_by(name: name)

    @artwork = @artist.artworks.new(artwork_params)
    @artwork.uploader_id = current_user.id
    @artwork.title = artwork_params[:title].titlecase

    if @artwork.save
      redirect_to "/backbone/#"
    else
      flash[:errors] = @artwork.errors.full_messages
      render :new
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def index
    @artworks = Artwork.includes(:artist).all
  end

  private
  def artwork_params
    params.require(:artwork).permit(:id, :title, :art_type, :image)
  end

end
