class UsersController < ApplicationController

  # def new
  #   render :new, :layout => false
  # end

  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     login(@user)
  #     redirect_to user_url(@user)
  #   else
  #     render :new, :layout => false
  #     flash.now[:errors] = @user.errors.full_messages
  #   end
  # end

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
