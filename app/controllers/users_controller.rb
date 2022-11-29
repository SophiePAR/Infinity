class UsersController < ApplicationController

  def show
    @tombstones = Tombstone.all
    @user = User.find(params[:id])
  end
end
