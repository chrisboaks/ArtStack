class BackboneController < ApplicationController
  def index
    redirect_to new_session_url unless logged_in?
  end
end
