class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @tombstone = @order.tombstone
    if @order.aasm.current_state == :accepted
      @order.go_back
      @order.save
    end
  end

  def create
    @tombstone = Tombstone.find(params[:tombstone_id])
    @order = Order.new
    @order.tombstone = @tombstone
    if @order.save
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.aasm.current_state == :accepted
      @order.go_to_next_step
      @order.save
    end
    redirect_to tombstone_path(@order.tombstone)
  end

  private

  def order_params
    params.require(:order).permit(:review, :rating, :date, :progress)
  end
end
