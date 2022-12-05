class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tombstones = @user.tombstones
    @tombstonesmap = Tombstone.all
    @markers = @tombstonesmap.geocoded.map do |tombstonemap|
      {
        lat: tombstonemap.latitude,
        lng: tombstonemap.longitude
      }
    end
  end
  def my_missions
    @orders = Order.where(user: current_user)
  end
end
