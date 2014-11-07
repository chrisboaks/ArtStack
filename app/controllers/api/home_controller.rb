class Api::HomeController < ApplicationController

  def index
    @artworks = current_user.home_artworks.includes(:artist).order("id ASC")
    render :index
  end

end
