class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["There was a problem with that username/password combination.  Please try again."]
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end

