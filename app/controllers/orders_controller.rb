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
    @order = Order.find(params[:id])
    @order.update(order_params)

    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:review, :rating, :date, :progress)
  end
end
