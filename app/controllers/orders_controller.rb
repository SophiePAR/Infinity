class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    # @order_items = OrderItem.all
  end

  def new
  end

  def create
    # @user = User.find(params[:user_id])
    # @tombstone = Tombstone.find(params[:tombstone_id])
    # @order = Order.new(order_params)
    # @order.tombstone_id = @tombstone.id
    # @order.user_id = @user.id
    # if @order.save
    #   render action: OrderItem.new
    # else
    #   render :new, status: :unprocessable_entity
    # end
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
