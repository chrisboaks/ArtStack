class StacksController < ApplicationController
  def create
    artwork = Artwork.find(params[:artwork])
    @stack = Stack.create({user: current_user, artwork: artwork})
    redirect_to artwork_url(artwork)
  end

  def destroy
    @stack = Stack.find(params[:id])
    artwork_id = @stack.artwork_id
    @stack.delete
    redirect_to artwork_url(artwork_id)
  end


  private

end
