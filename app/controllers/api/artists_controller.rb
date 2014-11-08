class Api::ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    render :index
  end

  def show
    @artist = Artist.includes(:artworks).find(params[:id])
    render :show
  end

  def update
    @artist = Artist.find(params[:id])
    to_follow = params[:follow]

    if to_follow == 'true'
      Follow.create(follower: current_user, followable: @artist)
    else
      follow = Follow.find_by(follower: current_user, followable: @artist)
      follow.destroy
    end
    render :show
  end

end
