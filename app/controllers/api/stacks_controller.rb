class Api::StacksController < ApplicationController

  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy
    render :json => @stack
  end

  def create
    @stack = Stack.create(artwork_id: params[:artwork_id], user_id: current_user.id)
    render :json => @stack
  end

end
