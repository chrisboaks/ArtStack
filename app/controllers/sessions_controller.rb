class SessionsController < ApplicationController
  def new
    render :new, :layout => false
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]

    @user = User.find_by(email: email)

    if @user && @user.is_password?(password)
      login(@user)
      redirect_to root_url
    elsif @user && @user.provider
      redirect_to "/auth/facebook"
    elsif @user
      flash.now[:errors] = "Incorrect password.  Please try again."
      render :new, :layout => false
    elsif User.new(email: email, password: password).save
      login(User.find_by(email: email))
      flash[:notice] = "New user successfully created!"
      redirect_to root_url
    else
      user = User.new(email: email, password: password)
      user.valid?
      flash.now[:errors] = user.errors.full_messages.join(', ')
      render :new, :layout => false
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
