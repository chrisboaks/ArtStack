class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, :layout => false

    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
