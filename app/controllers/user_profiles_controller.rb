class UserProfilesController < ApplicationController

  def edit
    @user_profile = UserProfile.find_or_initialize_by(user: current_user)
    render :edit
  end

  def update
    @user_profile = UserProfile.find_or_initialize_by(user: current_user)
    if @user_profile.update(user_profile_params)
      redirect_to root_url
    else
      flash[:errors] = @user_profile.errors.full_messages
      render :edit
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
      :is_artist,
      :is_art_professional,
      :is_collector,
      :is_art_lover,
      :is_curator,
      :is_art_writer,
      :is_student,
      :website
    )
  end

end
