class TombstonesController < ApplicationController

  def show
    @tomstone = Tombstone.fond(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
