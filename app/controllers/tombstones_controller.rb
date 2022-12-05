class TombstonesController < ApplicationController

  def show
    # @user = User.find(params[:id])
    @order = Order.new
    @tombstone = Tombstone.find(params[:id])
  end

  def new
    @tombstone = Tombstone.new
  end

  def create
    @tombstone = Tombstone.new(tombstone_params)

    if @tombstone.save
      UserTombstone.create(user: current_user, tombstone: @tombstone)
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tombstone = Tombstone.find(params[:id])
  end

  def update
    @tombstone = Tombstone.find(params[:id])
    @tombstone.update(tombstone_params)

    redirect_to tombstone_path(@tombstone)
  end

  private

  def tombstone_params
    params.require(:tombstone).permit(:first_name, :last_name, :birth_date, :latitude, :longitude, :death_date, :photo)
  end

end
