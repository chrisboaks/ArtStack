class Api::FollowsController < ApplicationController

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    render :json => @follow
  end

  def create
    @follow = Follow.create(
      followable_id: params[:followable_id],
      followable_type: params[:followable_type],
      follower: current_user
    )
    render :json => @follow
  end

end
