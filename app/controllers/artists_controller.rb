class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
    render :show
  end

  def index
    @artists = Artist.all
    render :index
  end

end
