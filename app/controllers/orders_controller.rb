class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @tombstone = @order.tombstone
  end

  def create
    @tombstone = Tombstone.find(params[:tombstone_id])
    @user = current_user
    @order = Order.new
    @order.tombstone = @tombstone
    @order.user = @user
    if @order.save
      redirect_to @order
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end
end
