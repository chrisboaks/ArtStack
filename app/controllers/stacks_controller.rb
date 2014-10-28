class StacksController < ApplicationController
  def create
    @stack = Stack.create(stack_params)
  end

  def destroy
    @stack = Stack.find(:id)
    @stack.delete
  end


  private

  def stack_params
    params.require(:stack).permit(:artwork, :user)
  end

end
