class Provider::OrdersController < ApplicationController
  def index
    @orders = Order.where(progress: "pending")
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
  end
end
