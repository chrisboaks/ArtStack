class ArtworksController < ApplicationController

  def new
    @artwork = Artwork.new
    render :new
  end

  def create
    @artist = Artist.find_or_initialize_by(name: params[:artist_name].capitalize)

    @artwork = @artist.artworks.new(artwork_params)
    @artwork.uploader_id = current_user.id

    if @artwork.save
      redirect_to artwork_url(@artwork)
    else
      flash[:errors] = @artwork.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def index
  end

  private
  def artwork_params
    params.require(:artwork).permit(:id, :title, :art_type, :image)
  end

end
