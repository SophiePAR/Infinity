class Provider::OrdersController < ApplicationController
  def index
    @orders = Order.where(progress: "pending")
    @tombstones = @orders.map do |order|
      order.tombstone
    end
      @markers = @tombstones.map do |tomb|
        {
          lat: tomb.latitude,
          lng: tomb.longitude
        }
      end
  end

  def show
    @order = Order.find(params[:id])
    @markers = []
    @markers << {
          lat: @order.tombstone.latitude,
          lng: @order.tombstone.longitude
        }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(user: current_user)
    @order.go_to_next_step
    @order.save
    redirect_to my_missions_path
    # case @order.aasm.current_state
    #   when "pending" then @order.declare_accepted
    #   when "accepted" then @order.declare_validated
    #   when "validated" then @order.declare_finished
    #   else
    # end
    # raise
  end
end
