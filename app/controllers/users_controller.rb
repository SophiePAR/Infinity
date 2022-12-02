class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tombstones = @user.tombstones
  end
end
