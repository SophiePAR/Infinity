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

  def destroy
    @orderitem = OrderItem.find(params[:id])
    @order = @orderitem.order
    @orderitem.destroy
    redirect_to order_path(@order), status: :see_other
  end

  private

  def order_params
    params.require(:order_item).permit(:details, :price, :prestation_id)
  end
end
