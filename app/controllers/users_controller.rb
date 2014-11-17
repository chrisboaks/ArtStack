class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_profile = UserProfile.find_by(user: @user) || nil
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
