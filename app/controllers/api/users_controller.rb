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

  def update
    @user = User.find(params[:id])
    to_follow = params[:follow]

    if to_follow == 'true'
      Follow.create(follower: current_user, followable: @user)
    else
      follow = Follow.find_by(follower: current_user, followable: @user)
      follow.destroy
    end
    render :show
  end
end
