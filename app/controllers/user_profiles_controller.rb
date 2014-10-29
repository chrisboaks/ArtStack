class UserProfilesController < ApplicationController

  def new
    @user_profile = UserProfile.new
    render :new
  end

  def create
    @user_profile = UserProfile.new(user: current_user)
    if @user_profile.save(user_profile_params)
      redirect_to user_url(@user_profile.user_id)
    else
      flash[:errors] = @user_profile.errors.full_messages
      render :new
    end
  end

  private
  def user_profile_params
    params.require(:user_profile).permit(
      :username,
      :first_name,
      :last_name,
      :location,
      :bio,
      :artist,
      :art_professional,
      :collector,
      :art_lover,
      :curator,
      :art_writer,
      :student,
      :website
    )
  end

end
