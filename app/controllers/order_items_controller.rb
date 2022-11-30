class OrderItemsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @orderitem = OrderItem.new(order_params)
    @orderitem.order_id = @order.id

    if @orderitem.save
      redirect_to order_path(@order)
    else
      render 'orders/show', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_item).permit(:details, :prestation_id)
  end
end
