class TombstonesController < ApplicationController

  def show
    @tombstone = Tombstone.find(params[:id])
  end

  def new
    @tombstone = Tombstone.new
  end

  def create
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
    params.require(:tombstone).permit(:first_name, :last_name, :birth_date, :death_date)
  end
end
