class Api::UsersController < ApplicationController

  def show
    @user = User.includes(
      :stacked_works,
      :user_profile,
      :uploaded_works,
      :stacked_artists,
      :uploaded_artists)
      .find(params[:id])

    render :show
  end

end