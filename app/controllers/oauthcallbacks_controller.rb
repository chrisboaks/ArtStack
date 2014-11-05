class OauthcallbacksController < ApplicationController

  def facebook
    @user = User.find_by(
      email:      request.env['omniauth.auth']['extra']['raw_info']['email']
    )

    if @user && !@user.provider
      @user.update(
        provider: request.env['omniauth.auth'][:provider],
        uid:      request.env['omniauth.auth'][:uid]
      )
    else
      @user = User.find_or_create_by({
        provider: request.env['omniauth.auth'][:provider],
        uid:      request.env['omniauth.auth'][:uid],
        email:    request.env['omniauth.auth']['extra']['raw_info']['email']
      })
    end

    login(@user)
    redirect_to "/backbone"
  end

end
