class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tombstones = @user.tombstones
    @markers = @tombstones.map do |tombstonemap|
      {
        lat: tombstonemap.latitude,
        lng: tombstonemap.longitude
      }
    end
  end

  def my_missions
    @orders = Order.where(user: current_user)
    @orders.each do |order|
      @tombstone = order.tombstone
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      head :ok
      redirect_to user_path(@user)
    else
      head :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :avatar, :email, :encrypted_password)
  end
end
