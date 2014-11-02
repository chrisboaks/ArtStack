class SessionsController < ApplicationController
  def new
    render :new, :layout => false
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = "There was a problem with that email/password combination.  Please try again."
      render :new, :layout => false
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end

