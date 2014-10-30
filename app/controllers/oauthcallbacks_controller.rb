class OauthcallbacksController < ApplicationController

  def facebook
    @user = User.find_or_create_by({
      provider: request.env['omniauth.auth'][:provider],
      uid:      request.env['omniauth.auth'][:uid],
      email:    request.env['omniauth.auth']['extra']['raw_info']['email']
    })
    login(@user)
    redirect_to user_url(@user)
  end

end
