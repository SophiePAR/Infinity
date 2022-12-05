class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tombstones = @user.tombstones
  end

  def my_missions
    @orders = Order.where(user: current_user)
  end
end
