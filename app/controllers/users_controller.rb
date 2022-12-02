class UsersController < ApplicationController

  def show
    @tombstones = Tombstone.all
    @user = User.find(params[:id])
  end
  def my_missions
    @orders = Order.where(user: current_user)
  end
end
